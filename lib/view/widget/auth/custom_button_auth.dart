import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
class CustomButtonAuth extends StatelessWidget {

  final String? text;
  final void Function()? onPressed;
  CustomButtonAuth({Key? key,required this.onPressed,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: MaterialButton(
        onPressed:onPressed,
        textColor: AppColors.white,
        color: AppColors.primaryColor,
        child: Text(
          text!,
          style: const TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        shape: const StadiumBorder(),
      ),
    );

  }
}
