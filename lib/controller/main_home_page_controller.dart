
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/screen/favorites.dart';
import 'package:e_commerce_app/view/screen/home.dart';
import 'package:e_commerce_app/view/screen/profile.dart';
import 'package:e_commerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainHomePageController extends GetxController
{
  changePage(int index);
  changeColor(int index);
  goToCart();
}

class MainHomePageControllerImp extends MainHomePageController
{
  int currentPage=0;
  List<Widget> pages=[
    Home(),
    const Favorites(),
     Settings(),
    const Profile(),
  ];



  List<String> pageIcon=[
    AppImageAsset.home,
    AppImageAsset.favorite,
    AppImageAsset.settings,
    AppImageAsset.user
  ];

  @override
  changePage(int index) {
    currentPage=index;
    update();
  }

  @override
  Color changeColor(int index) {
    if(currentPage==(index>2? index-1:index))
      {
        return AppColors.primaryColor;
      }
    else
      {
        return AppColors.lightGery;
      }
  }

  @override
  goToCart() {
   Get.toNamed(AppRoutes.cartScreen);
  }

}