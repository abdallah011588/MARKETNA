
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOfferCard extends GetView<HomeControllerImp> {
  final String title;
  final String subTitle;

  const CustomOfferCard({Key? key,required this.title,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.symmetric(horizontal: 0,vertical: 25),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: ListTile(
                title: Text(title,style: const TextStyle(color: AppColors.white,fontSize: 15),),
                subtitle: Text(subTitle,style:const TextStyle(color: AppColors.white,fontSize: 30),),
              ),
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: -80,
              right:controller.myServices.shared!.getString("lang")=="en"? -10:null,
              left: controller.myServices.shared!.getString("lang")=="ar"? -10:null,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: AppColors.purple2,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ]),
    );
  }
}
