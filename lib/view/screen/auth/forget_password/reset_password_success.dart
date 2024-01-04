import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordSuccess extends StatelessWidget {
  const ResetPasswordSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "resetPasswordSuccess".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          Image.asset(AppImageAsset.successImage,height:  MediaQuery.of(context).size.width*0.8 ,  fit: BoxFit.fill ,),
          Text("resetPasswordSuccess".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
            ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.6,
            child: CustomButtonAuth(

                  onPressed: (){
                    Get.offAllNamed(AppRoutes.login);
                  },
                text: "backLogin".tr,
              ),
          ),

          ],
        ),
      ),
    );
  }
}
