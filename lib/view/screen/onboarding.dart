import 'package:e_commerce_app/controller/onboarding_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/data_source/static/static.dart';

class OnBoarding extends GetView<OnboardingControllerImp> {
  // var pageController = PageController();

  OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "MARKETNA", //onBoardingList[index].title!,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        onBoardingList[index].body!.tr,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                      Image.asset(
                        onBoardingList[index].image!,
                        height: Get.height /
                            3, // MediaQuery.of(context).size.height / 3,
                        width: Get.width /
                            1.5, // MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.fill,
                      ),
                    ],
                  );
                },
                itemCount: onBoardingList.length,
                controller: controller.pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  controller.onPageChanged(index);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotColor: AppColors.primaryColor2,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
                controller: controller.pageController,
                count: onBoardingList.length,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  GetBuilder<OnboardingControllerImp>(
                    init: OnboardingControllerImp(),
                    builder: (controller) => SizedBox(
                      width: Get.width / 1.5,
                      child: CustomButtonAuth(
                        onPressed: () {
                          controller.next();
                        },
                        text: controller.text.tr,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.skip();
                    },
                    child:
                        Text("skip".tr, style: const TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
