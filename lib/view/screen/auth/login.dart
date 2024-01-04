import 'package:e_commerce_app/controller/auth/login_controller.dart';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/alert_exit.dart';
import 'package:e_commerce_app/core/functions/validator.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/sign_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "signIn".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) =>
          /* controller.requestStatus==RequestStatus.loading?
          Center(child: Lottie.asset( AppImageAsset.loading, height: 250 ,width: 200))
              : */
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Form(
            key: controller.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  "welcome".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "signInSubtitle".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                const SizedBox(
                  height: 60,
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
                  password: false,
                  keyBoardType: TextInputType.visiblePassword,
                  label: "Password".tr,
                  hint: "Enter_password".tr,
                  suffixIcon: Icons.lock_outlined,
                  controller: controller.passwordController,
                  valid: (val) {
                    return validInput(val!, 5, 50, "password");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Checkbox(
                        value: controller.remember,
                        activeColor: AppColors.primaryColor,
                        onChanged: (v) {
                      controller.rememberMe();
                    },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Remember_me".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          controller.forgetPassword();
                        },
                        child: Text(
                          "Forget_password".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                controller.requestStatus==RequestStatus.loading?
                const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                :CustomButtonAuth(
                  onPressed: () {
                    controller.login();
                  },
                  text: "Continue".tr,
                ),

                const SizedBox(
                  height: 50,
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
                      "have_no_account".tr,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    TextButton(
                        onPressed: () {
                          controller.goToSignUp();
                        },
                        child: Text(
                          "signUp".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.primaryColor),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),

        ),
      ),
    );
  }
}
