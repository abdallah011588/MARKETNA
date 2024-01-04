import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/data_source/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
  skip();
}

class OnboardingControllerImp extends OnboardingController {
  var pageController = PageController();
  int currentPage = 0;
  String text = "Continue";
  MyServices myServices = Get.find();

  @override
  next() {
    if (currentPage < onBoardingList.length - 1) {
      print(currentPage);
      currentPage++;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      skip();
    }
  }

  @override
  onPageChanged(int index) {
    if (index < onBoardingList.length - 1) {
      text = "Continue";
    }
    if (index == onBoardingList.length - 1) {
      text = "let'sGo";
    }
    currentPage = index;
    update();
  }

  @override
  skip() {
    myServices.shared!.setBool("onboarding", true);
    Get.offAllNamed(AppRoutes.login);
    //Get.delete<OnboardingControllerImp>();
  }
}
