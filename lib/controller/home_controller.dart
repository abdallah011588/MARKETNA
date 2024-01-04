import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/home_data.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/request_status.dart';

abstract class HomeController extends SearchMixController {
  logOut();
  // initialDta();
  getData();
  goToProducts(List categories,int selectedCategory ,String categoryId);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List products = [];
  List settings = [];
  String? username;
  String? lang;

  String settingsTitle ="";
  String settingsBody ="";
  String settingsDeliveryTime ="";


  @override
  logOut() {
    myServices.shared!.setBool("isLogin", false).then((value) {
      print(myServices.shared!.getBool("isLogin"));
      Get.offAllNamed(AppRoutes.login);
    });
  }

  @override
  getData() async {
    requestStatus = RequestStatus.loading;
    var response = await homeData.getData();
    requestStatus = handlingData(response);

    if (requestStatus == RequestStatus.success) {
      if (response['status'] == "success") {
        categories=[];
        products=[];
        settings=[];
        categories.addAll(response['categories']['data']);
        products.addAll(response['products']['data']);
        settings.addAll(response['settings']['data']);
        if(settings.isNotEmpty)
          {
            settingsTitle= settings[0]["settings_title"].toString();
            settingsBody= settings[0]["settings_body"].toString();
            settingsDeliveryTime= settings[0]["settings_delivery_time"].toString();
            myServices.shared!.setString("deliveryTime", settings[0]["settings_delivery_time"].toString());
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
    getData();
    lang=myServices.shared!.getString("lang");
    // username = myServices.shared!.getString("email");
    super.onInit();

  }

  @override
  goToProducts( categories, selectedCategory ,categoryId) {
    Get.toNamed(
      AppRoutes.products,
      arguments: {
        "categories":categories,
        "selectedCategory":selectedCategory,
        "categoryId":categoryId,
      },
    );
  }

  gotToProductDetails(productModel) {
    Get.toNamed(AppRoutes.productDetails,arguments: {"productModel":productModel});
  }

  gotToNotifications() {
    Get.toNamed(AppRoutes.notifications);
  }

}


class SearchMixController extends GetxController{
  late RequestStatus requestStatus;
  HomeData homeData = HomeData(Get.find());
  List<ProductModel> searchProducts = [];
  TextEditingController? searchController;
  bool isSearch=false;

  checkSearch(text)
  {
    if(text=="")
    {
      requestStatus=RequestStatus.none;
      isSearch=false;
    }
    update();
  }
  onSearch(){
    if(searchController!.text !="")
    {
      isSearch=true;
      searchData();
    }
    update();
  }
  searchData() async {
    if(searchController!.text!=" ")
      {
        requestStatus = RequestStatus.loading;
        var response = await homeData.searchData(searchController!.text);
        requestStatus = handlingData(response);
        if (requestStatus == RequestStatus.success) {
          if (response['status'] == "success") {
            searchProducts=[];
            List responseData=response['data'];
            searchProducts.addAll(responseData.map((e) => ProductModel.fromJson(e)));
            print(response['data'].toString());

          }
          else
          {
            searchProducts=[];
            requestStatus = RequestStatus.failure;
          }
        }
        update();
      }
    else
      {
        searchProducts=[];
        requestStatus = RequestStatus.failure;
      }
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.subscribeToTopic("users");
    searchController=TextEditingController();

    super.onInit();
  }
}