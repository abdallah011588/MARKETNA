import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingAddressCard extends StatelessWidget {
  const ShippingAddressCard({
    Key? key,
    required this.addressTitle,
    required this.addressDetails,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final String addressTitle;
  final String addressDetails;
  final bool isActive;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: isActive? AppColors.primaryColor:AppColors.white,
        border: Border.all(width: 1,color: AppColors.primaryColor,),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: SvgPicture.asset("assets/icons/Location point.svg",
          color: isActive? AppColors.white :AppColors.black,
          height: 30,
        ),
        title: Text(addressTitle,style: TextStyle(color: isActive? AppColors.white :AppColors.black,fontWeight: FontWeight.bold,fontSize: 17),),
        subtitle: Text(addressDetails,style: TextStyle(color: isActive? AppColors.white :AppColors.black,fontSize: 15),),
        onTap: onPressed,
      ),
    );
  }
}
