
import 'package:e_commerce_app/core/constant/image_asset.dart';

import '../../model/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Choose product",
      body: "onboardingSubTitle1",//"Welcome to MARKETNA, Let’s shop!",//"We have 100K products , Choose \n your product from our \n E-commerce shop",
      image: AppImageAsset.onBoardingImage1,
  ),
  OnBoardingModel(
      title: "Easy and save payment",
      body: "onboardingSubTitle2",//"We help people connect with store \n around United State of America",
      image: AppImageAsset.onBoardingImage2,
  ),
  OnBoardingModel(
      title: "Track your order",
      body: "onboardingSubTitle3",//"We show the easy way to shop. \n Just stay at home with us",
      image: AppImageAsset.onBoardingImage3,
  ),

];