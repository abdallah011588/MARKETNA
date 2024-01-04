import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// TextEditingController controller = TextEditingController();

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
    required this.totalCost,
    required this.discount,
    required this.shipping,
    required this.onPressedApply,
    required this.onPressedCheckout,
    required this.controller,
  }) : super(key: key);

  final String totalCost;
  final String discount;
  final String shipping;
  final void Function()? onPressedApply;
  final void Function()? onPressedCheckout;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(builder: (pageController) => Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.35),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            pageController.coupon_name != null?
            Center(child: Text("${pageController.coupon_name}"+ "Coupon is applied".tr,style: const TextStyle(fontWeight: FontWeight.bold,color: AppColors.green),))
           : Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.lightGery3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Form(
                      key: pageController.formKey,
                      child: CustomTextFormField(
                        label: "Coupon Code".tr,
                        hint: "Coupon".tr,
                        suffixIcon: null,//Icons.code,
                        controller: controller,
                        valid: (val){
                         // return validInput(val!, 3, 50, "");
                        },
                        keyBoardType: TextInputType.text,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  // width: 80,
                  height: 50,
                  child: CustomButtonAuth(onPressed: onPressedApply, text: "Apply".tr),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total".tr+":\n",
                    children: [
                      TextSpan(
                        text: totalCost,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "Discount".tr +":\n",
                    children: [
                      TextSpan(
                        text: discount+"%",
                        style:
                        const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "Shipping".tr+":\n",
                    children: [
                      TextSpan(
                        text: shipping,
                        style:
                        const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width:double.infinity,
              height: 50,
              child: CustomButtonAuth(onPressed: onPressedCheckout, text: "Check Out".tr),
            ),

          ],
        ),
      ),
    ),);
  }
}
