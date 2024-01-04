import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PaymentMethodCard extends StatelessWidget {

  const PaymentMethodCard({Key? key,
    required this.title,
    required this.svgIcon,
    required this.isActive,
  }) : super(key: key);

  final String title;
  final String svgIcon;
  final bool isActive;


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      decoration: BoxDecoration(
        color:isActive? AppColors.primaryColor:AppColors.white,
        border: Border.all(width: 1,color: AppColors.primaryColor,),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text( title,style: TextStyle(color: isActive? AppColors.white:AppColors.grey,fontSize: 18,),),
          SvgPicture.asset(svgIcon,color: isActive? AppColors.white:AppColors.primaryColor,height: 30),
        ],
      ),
    );
  }
}
// assets/icons/Cash.svg