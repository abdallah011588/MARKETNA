
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/myfavorite_data.dart';
import 'package:e_commerce_app/data/model/favorite_model.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController{

  MyServices myServices = Get.find();
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  late RequestStatus requestStatus ;
  List<FavoriteModel> allFavorite = [];

  ProductModel? productModel;


  getAllFavorite()async {
    requestStatus = RequestStatus.loading;
    var response  = await myFavoriteData.getAllFavorite(myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        allFavorite=[];
        List responseData=response['data'];
        allFavorite.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));
        print(allFavorite);
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  deleteFavorite(String favoriteId)async {
    requestStatus = RequestStatus.loading;
    var response  = await myFavoriteData.deleteFavorite(favoriteId);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        allFavorite.removeWhere((element) => element.favoriteId.toString()==favoriteId);
       //getAllFavorite();
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();

  }

  gotToProductDetails(String categoryId,String productId)async {

    requestStatus = RequestStatus.loading;
    var response  = await myFavoriteData.getData(categoryId, myServices.shared!.getString("id")! ,productId);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        // List responseData=response['data'];
        productModel=ProductModel.fromJson(response['data']);
        if(productModel !=null)
          {
            Get.toNamed(AppRoutes.productDetails,arguments: {"productModel":productModel});
          }
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getAllFavorite();
    super.onInit();
  }


}