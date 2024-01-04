import 'package:e_commerce_app/controller/auth/signup_controller.dart';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/alert_exit.dart';
import 'package:e_commerce_app/core/functions/validator.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/sign_button.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SignUpControllerImp controller = Get.put(SignUpControllerImp());
    Get.put(SignUpControllerImp());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "signUp".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            )),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) {
            return
              /* controller.requestStatus==RequestStatus.loading?
                LottieBuilder.asset(AppImageAsset.loading):
                */
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      "register".tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "signUpSubtitle".tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      keyBoardType: TextInputType.text,
                      label: "UserName".tr,
                      hint: "Enter_name".tr,
                      suffixIcon: Icons.person_outlined,
                      controller: controller.nameController,
                      valid: (val) {
                        return validInput(val!, 3, 50, "username");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      keyBoardType: TextInputType.emailAddress,
                      label: "Email".tr,
                      hint: "Enter_email".tr,
                      suffixIcon: Icons.email_outlined,
                      controller: controller.emailController,
                      valid: (val) {
                        return validInput(val!, 11, 50, "email");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      keyBoardType: TextInputType.phone,
                      label: "Phone".tr,
                      hint: "Enter_phone".tr,
                      suffixIcon: Icons.phone_outlined,
                      controller: controller.phoneController,
                      valid: (val) {
                        return validInput(val!, 7, 30, "phone");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      keyBoardType: TextInputType.visiblePassword,
                      label: "Password".tr,
                      hint: "Enter_password".tr,
                      suffixIcon: Icons.lock_outlined,
                      controller: controller.passwordController,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    controller.requestStatus==RequestStatus.loading?
                    const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                        :CustomButtonAuth(
                      onPressed: () {
                        controller.signUp();
                      },
                      text: "Continue".tr,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton.mini(
                          buttonType: ButtonType.google,
                          onPressed: () {},
                        ),
                        SignInButton.mini(
                          buttonType: ButtonType.facebook,
                          onPressed: () {},
                        ),
                        SignInButton.mini(
                          buttonType: ButtonType.twitter,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "have_account".tr,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        TextButton(
                            onPressed: () {
                              controller.goToLogin();
                            },
                            child: Text(
                              "signIn".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppColors.primaryColor),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
