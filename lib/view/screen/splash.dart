

import 'dart:async';

import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/check_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? timer;
  var res;
  void goTo() {
    timer = Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.language);
    });
  }

   checkConnection() async{
    res =await checkInternet();
  }

  @override
  void initState() {
    checkConnection();
    goTo();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
        ),
      ),
      body: Center(
        child: Image.asset(AppImageAsset.marketna ,height: 400,),
      ),
    );
  }
}
