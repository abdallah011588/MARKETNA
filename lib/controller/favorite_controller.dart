
import 'package:e_commerce_app/controller/myfavorite_controller.dart';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{

  MyServices myServices = Get.find();
  late RequestStatus requestStatus ;

  FavoriteData favoriteData = FavoriteData(Get.find());
  MyFavoriteController myFavoriteController=Get.put(MyFavoriteController());



  Map isFavorite={};
  setFavorite(id,val)
  {
    isFavorite[id]= val;
    update();
  }

  addFavorite( productId )async {
    requestStatus = RequestStatus.loading;
    var response  = await favoriteData.addFavorite( productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        Get.rawSnackbar(title: "Notification".tr,messageText: Text("Product is added to favorite".tr));
        myFavoriteController.getAllFavorite();
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();

  }

  removeFavorite( productId )async {
    requestStatus = RequestStatus.loading;
    var response  = await favoriteData.removeFavorite( productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        Get.rawSnackbar(title: "Notification".tr,messageText: Text("Product is removed from favorite".tr));
        myFavoriteController.getAllFavorite();
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();

  }

  // @override
  // void onInit() {
  //   isFavorite={};
  //   super.onInit();
  // }


  //
  // @override
  // void onClose() {
  //   /// //////////////////////////
  //   // MyFavoriteController myFavoriteController=Get.put(MyFavoriteController());
  //   myFavoriteController.getAllFavorite();
  //   super.onClose();
  // }
}