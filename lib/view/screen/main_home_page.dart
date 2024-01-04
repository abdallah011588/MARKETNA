import 'dart:io';

import 'package:e_commerce_app/controller/main_home_page_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/view/widget/home/custom_button_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomePageControllerImp());
    return GetBuilder<MainHomePageControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: WillPopScope(
           child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.only(top: 10.0),
            child: controller.pages.elementAt(controller.currentPage),
          ),
            onWillPop:(){
              Get.defaultDialog(
                title: "Warning".tr,
                titleStyle: const TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold),
                middleText: "Do you want to exit the app".tr,
                actions: <Widget>[
                  TextButton(
                    child: Text("Yes".tr,style: TextStyle(color: AppColors.red),),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  TextButton(
                    child: Text("Close".tr),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              );
              return Future.value(false);
          },),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(
                  controller.pages.length + 1,
                  (index) => index == 2 ? const Spacer()
                      : CustomButtonBottomNavigationBar(
                          onPress: () {
                            controller.changePage(index > 2 ? index - 1 : index);
                          },
                          childWidget: SvgPicture.asset(
                            controller.pageIcon[index > 2 ? index - 1 : index],
                            color: controller.changeColor(index),
                          ),
                        ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.goToCart();
            },
            child: SvgPicture.asset(
              // AppImageAsset.home,
              AppImageAsset.cart,
              color: AppColors.lightGery2,
            ),
            backgroundColor: AppColors.primaryColor,
          ),

        );
      },
    );
  }
}
