import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/cart_data.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController
{

  // CartController cartController =Get.put(CartController());
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  late RequestStatus requestStatus ;
  int productCount = 0;
  late ProductModel productModel;
  List subItems=[
    {"color":AppColors.lightGery,"id":1,"active":"1"},
    {"color":AppColors.red,"id":1,"active":"0"},
    {"color":AppColors.black,"id":1,"active":"0"},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }


  addCart()async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.addCart( productModel.productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        productCount++;
        // Get.rawSnackbar(title: "Notification",messageText:const Text("Product is added to Cart"));
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  removeCart( )async {
    if(productCount>0)
    {
      requestStatus = RequestStatus.loading;
      var response = await cartData.removeCart(
          productModel.productId.toString(),
          myServices.shared!.getString("id")!);
      requestStatus = handlingData(response);
      if (requestStatus == RequestStatus.success) {
        if (response['status'] == "success") {
          productCount--;
          // Get.rawSnackbar(title: "Notification", messageText: const Text("Product is removed from cart"));
        } else {
          requestStatus = RequestStatus.failure;
        }
      }
      update();
    }
  }

  getCount( )async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.getCountCart( productModel.productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        int productCartCount=0;
        productCartCount= response['data'];
        print(response['data'].toString());
        return productCartCount;
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }



  @override
  initialData() async{
    requestStatus =RequestStatus.loading;
    productModel = Get.arguments['productModel'];
    productCount = await getCount();
    requestStatus =RequestStatus.success;
    update();
  }



}