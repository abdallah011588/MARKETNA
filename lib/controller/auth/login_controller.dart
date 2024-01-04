import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  forgetPassword();
  goToSignUp();
  rememberMe();
}

class LoginControllerImp extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RequestStatus? requestStatus;
  LoginData loginData =LoginData(Get.find());
  MyServices myServices=Get.find();
  bool remember=false;


  @override
  login() async{
    var formData = formKey.currentState;
    if (formData!.validate()){

      requestStatus = RequestStatus.loading;
      update();
      var response  = await loginData.postData(
        emailController.text,
        passwordController.text,
      );

      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success)
      {
        if(response['status'] == "success")
        {
         if(response['data']['user_approve'].toString()=="1")
         {
           myServices.shared!.setString("id",response['data']['user_id'].toString());
           // String userId= myServices.shared!.getString("id")!;
           String userId=response['data']['user_id'].toString();
           myServices.shared!.setString("email",response['data']['user_email'] );
           myServices.shared!.setString("username",response['data']['user_name'] );
           myServices.shared!.setString("phone",response['data']['user_phone'] );

           FirebaseMessaging.instance.subscribeToTopic("users");
           FirebaseMessaging.instance.subscribeToTopic("users${userId}");

           myServices.shared!.setBool("isLogin" ,true);
           Get.offAllNamed(AppRoutes.loginSuccess);
         }
         else
         {
             Get.offAllNamed(
                 AppRoutes.verifyCodeSignUp,
                 arguments: {"email":emailController.text}
             );
           }

        }
        else
        {
          Get.defaultDialog(
            title: "Warning".tr,
            middleText:"Email or password is incorrect!".tr ,
          );
          requestStatus = RequestStatus.failure;
        }
      }
      if(requestStatus == RequestStatus.server_failure)
      {
          Get.defaultDialog(
            title: "Warning".tr,
            middleText:"Something went wrong server failure!".tr ,
          );
        }
      if(requestStatus == RequestStatus.server_exception)
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"Something went wrong server exception!".tr ,
        );
      }
      if(requestStatus == RequestStatus.offline_failure)
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"You are offline!".tr ,
        );
      }

      update();
    }
    else {}
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signup);
    // Get.delete<LoginControllerImp>();
  }

  @override
  forgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
    //  Get.delete<LoginControllerImp>();
  }


  @override
  rememberMe() {
    remember =!remember;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });

    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


}
