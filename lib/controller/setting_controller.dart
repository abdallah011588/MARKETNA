

import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/test_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SettingController extends GetxController
{
  TestData testData = TestData(Get.find());
  List data = [];
  late RequestStatus requestStatus ;

  MyServices myServices=Get.find();
  bool notification=true;
  String? language;
  String? theme;

  void goToOrdersScreen()
  {
    Get.toNamed(AppRoutes.orders);
  }

  void goToAddressScreen()
  {
    Get.toNamed(AppRoutes.addressView);
  }

  void changeLanguage(lang)
  {
    language=lang;
    if(lang=="Arabic")
      {
        myServices.shared!.setString("lang","ar");
        Locale locale = const Locale("ar");
        Get.updateLocale(locale);
      }
    else
      {
        myServices.shared!.setString("lang","en");
        Locale locale = const Locale("en");
        Get.updateLocale(locale);
      }
    update();
  }
  void changeTheme(appearance)
  {
    theme=appearance;
    myServices.shared!.setString("theme",appearance);
    update();
  }

  void changeNotification()
  {
    notification=!notification;
    update();
  }

  logOut() {
    myServices.shared!.setBool("isLogin", false).then((value) {
      String userId= myServices.shared!.getString("id")!;
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users${userId}");
      Get.offAllNamed(AppRoutes.login);
    });
  }

  showAppearanceModal( ) {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16),
          height: 320,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight:  Radius.circular(20),
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select a Theme".tr, style: const TextStyle(color: AppColors.black,fontSize: 17)),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(Icons.brightness_5, color: Colors.blue,),
                title: Text("Light".tr, style: const TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeTheme("Light");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: theme == 'Light' ? Colors.blue : Colors.transparent,),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.brightness_2, color: Colors.orange,),
                title: Text("Dark".tr, style: const TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeTheme("Dark");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: theme == 'Dark' ? Colors.orange : Colors.transparent,),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.brightness_6, color: Colors.blueGrey,),
                title: Text("System".tr, style:const TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeTheme("System");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: theme == 'System' ? Colors.blueGrey : Colors.transparent,),
              ),
            ],
          ),
        )
    );
  }

  showLanguageModal() {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16),
          height: 250,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight:  Radius.circular(20),
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select a Language".tr, style: const TextStyle(color: AppColors.black,fontSize: 17)),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(Icons.language_outlined, color: Colors.blue,),
                title: Text("English".tr, style: const TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeLanguage("English");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: language == 'English' ? Colors.blue : Colors.transparent,),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.language_outlined, color: Colors.orange,),
                title: Text("Arabic".tr, style: const TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeLanguage("Arabic");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: language == 'Arabic' ? Colors.orange : Colors.transparent,),
              ),
            ],
          ),
        )
    );
  }






  @override
  void onInit() {
   language=myServices.shared!.getString("lang")=="ar"?"Arabic":"English";
   theme= myServices.shared!.getString("theme")==null?"Light": myServices.shared!.getString("theme");

    super.onInit();
  }

}
