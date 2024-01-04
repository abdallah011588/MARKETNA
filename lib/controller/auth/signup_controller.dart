import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/data_source/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   RequestStatus? requestStatus;
  SignupData signupData =SignupData(Get.find());
  List data = [];

  @override
  signUp()async {
    var formData = formKey.currentState;
    if (formData!.validate()) {

      requestStatus = RequestStatus.loading;
      update();
      var response  = await signupData.postData(
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
      );

      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success)
      {
        if(response['status'] == "success")
        {
          //data.addAll(response['data']);
          Get.offAllNamed(AppRoutes.verifyCodeSignUp, arguments: {
            "email" : emailController.text,
          });
        }
        else
        {
          Get.defaultDialog(
            title: "Warning",
            middleText:"Email or phone number already is exist" ,
          );
          requestStatus = RequestStatus.failure;
        }
      }
      if(requestStatus == RequestStatus.server_failure)
      {
        Get.defaultDialog(
          title: "Warning",
          middleText:"Something went wrong server failure!" ,
        );
      }
      if(requestStatus == RequestStatus.server_exception)
      {
        Get.defaultDialog(
          title: "Warning",
          middleText:"Something went wrong server exception!" ,
        );
      }
      if(requestStatus == RequestStatus.offline_failure)
      {
        Get.defaultDialog(
          title: "Warning",
          middleText:"You are offline!" ,
        );
      }
      update();
      // Get.offAllNamed(AppRoutes.verifyCodeSignUp);
    }
    else {
      }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
