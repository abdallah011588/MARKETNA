import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/data_source/remote/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPass();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  String?  email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RequestStatus? requestStatus;
  ResetPasswordData resetPasswordData =ResetPasswordData(Get.find());
  @override
  resetPass() async{
    var formData = formKey.currentState;
    if (formData!.validate() ) {

      if(passwordController.text !=rePasswordController.text)
        {
          Get.defaultDialog(
            title: "Warning",
            middleText:"Password is not match" ,
          );
        }
      else
        {
          requestStatus = RequestStatus.loading;
          update();
          var response  = await resetPasswordData.postData(
            email!,
            passwordController.text,
          );

          requestStatus = handlingData(response);
          if(requestStatus == RequestStatus.success)
          {
            if(response['status'] == "success")
            {
              Get.offAllNamed(AppRoutes.resetPasswordSuccess);
            }
            else
            {
              Get.defaultDialog(
                title: "Warning",
                middleText:"Something went wrong!" ,
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
  }

  @override
  void onInit() {
    email =Get.arguments['email'];
    rePasswordController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    rePasswordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}
