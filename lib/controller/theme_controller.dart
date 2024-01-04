

import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/test_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemesController extends GetxController
{
  TestData testData = TestData(Get.find());
  List data = [];
  late RequestStatus requestStatus ;

  MyServices myServices = Get.find();


  var theme = 'light';

  @override
  void onInit() {
    super.onInit();

    getThemeState();
  }

  getThemeState() {
    if (myServices.shared!.getString('theme') != null) {
      return setTheme(myServices.shared!.getString('theme')!);
    }

    setTheme('light');
  }

  void setTheme(String value) {
    theme = value;
    myServices.shared!.setString('theme', value);

    if (value == 'system') Get.changeThemeMode(ThemeMode.system);
    if (value == 'light') Get.changeThemeMode(ThemeMode.light);
    if (value == 'dark') Get.changeThemeMode(ThemeMode.dark);

    update();
  }


}
