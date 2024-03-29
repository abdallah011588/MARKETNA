import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/fcm_config.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {

  Locale? language;

  MyServices myServices = Get.find();
  TextEditingController ? languageTextController;

  changeLang(String langCode) {
    myServices.shared!.setString("lang", langCode);
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
  }

  changeLang2() {
    if(languageTextController!.text.isNotEmpty)
    {
      if(languageTextController!.text=="Arabic")
      {
        myServices.shared!.setString("lang", "ar");
        Locale locale = const Locale("ar");
        Get.updateLocale(locale);
        goToLogin();
      }
      else if(languageTextController!.text=="English")
      {
        myServices.shared!.setString("lang", "en");
        Locale locale = const Locale("en");
        Get.updateLocale(locale);
        goToLogin();
      }
    }
    else
    {
      Get.snackbar("Information", "Please select the language");
      FlutterRingtonePlayer.playNotification(looping: false,);
    }

  }


  goToLogin(){
    myServices.shared!.setBool("language", true).then((value) {
      Get.offAllNamed(AppRoutes.onboarding);
    });
  }

  @override
  void onInit() {
    requestNotificationPermission();
    fcmConfig();
    languageTextController=TextEditingController();

    String? langFromShared = myServices.shared!.getString("lang");
    if (langFromShared == "ar") {
      language = const Locale("ar");
      // Get.updateLocale(language!);
    }
    if (langFromShared == "en") {
      language = const Locale("en");
      // Get.updateLocale(language!);
    }
    if (langFromShared == null) {
      language = Locale(Get.deviceLocale!.languageCode);
      // Get.updateLocale(language!);
    }

    super.onInit();
  }

  @override
  void dispose() {
    languageTextController!.dispose();
    super.dispose();
  }

}
