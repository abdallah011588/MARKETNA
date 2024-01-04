import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryTypeCard extends StatelessWidget {
  const DeliveryTypeCard({
    Key? key,
    required this.title,
    required this.svgIcon,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String svgIcon;
  final bool isActive;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isActive? AppColors.primaryColor:AppColors.white,
            border: Border.all(width: 1,color: AppColors.primaryColor,),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(svgIcon,color: isActive? AppColors.white:AppColors.primaryColor,height: 55,),
               Text(title, style: TextStyle(color: isActive? AppColors.white:AppColors.primaryColor, fontSize: 18,)
              ),
            ],
          ),
        ),
      ],
    );
  }
}
