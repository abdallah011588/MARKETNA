

import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/products_data.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:get/get.dart';

import '../core/class/request_status.dart';

abstract class ProductsController extends SearchMixController {
 initialData();
 gotToProductDetails(ProductModel productModel);
 changeCategory(int index,String catId);
 getProducts(String categoryId);
}

class ProductsControllerImp extends  ProductsController{
  // HomeData homeData = HomeData(Get.find());

  List categories = [];
  int? selectedCategories;
  String? categoryId;
  MyServices myServices = Get.find();

  ProductsData productsData = ProductsData(Get.find());
  List<ProductModel> products = [];
   late RequestStatus requestStatus ;

  @override
  void onInit() {
    // searchController=TextEditingController();

    initialData();
    super.onInit();
  }



  @override
  initialData() {
    // print("+++++++++++++++++++++++++++++++"+myServices.shared!.getString("id")!);
   categories = Get.arguments['categories'];
   selectedCategories = Get.arguments['selectedCategory'];
   categoryId = Get.arguments['categoryId'];
   getProducts(categoryId!);
  }

  @override
  changeCategory(index ,catId) {
   selectedCategories = index ;
   getProducts(catId) ;
   update();
  }


  @override
  getProducts( categoryId )async {
    requestStatus = RequestStatus.loading;
    var response  = await productsData.getData( categoryId ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        products=[];
        List dataList=response['data'];
        products.addAll(dataList.map((e) => ProductModel.fromJson(e)));
        // products.addAll(response['data']);
      }
      else
      {
        products=[];
        requestStatus = RequestStatus.failure;
      }
    }
    update();

  }

  @override
  gotToProductDetails(productModel) {
    Get.toNamed(AppRoutes.productDetails,arguments: {"productModel":productModel});
  }


}
