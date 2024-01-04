import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/data_source/remote/forget_password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  verification();
  goToSignUp();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RequestStatus? requestStatus;
  ForgetPasswordData checkEmail =ForgetPasswordData(Get.find());


  @override
  verification()async {

    var formData = formKey.currentState;
    if (formData!.validate()) {


      requestStatus = RequestStatus.loading;
      update();
      var response  = await checkEmail.postData(
        emailController.text,
      );

      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success)
      {
        if(response['status'] == "success")
        {
          //Get.offAllNamed(AppRoutes.verifyCode);
          Get.offAllNamed(AppRoutes.verifyCode, arguments: {
            "email" : emailController.text,
          });
        }
        else
        {
          Get.defaultDialog(
            title: "Warning",
            middleText:"Email is not exist or incorrect" ,
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



    }
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signup);
    // Get.delete<ForgetPasswordControllerImp>();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
