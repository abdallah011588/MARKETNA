
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
{
  MyServices myServices =Get.find();
  String? userName;
  String? userEmail;
  String? userPhone;


  logOut() {
    myServices.shared!.setBool("isLogin", false).then((value) {
      String userId= myServices.shared!.getString("id")!;
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users${userId}");
      print(myServices.shared!.getBool("isLogin"));
      Get.offAllNamed(AppRoutes.login);
    });
  }

  void goToOrdersScreen()
  {
    Get.toNamed(AppRoutes.orders);
  }

  void goToAddressScreen()
  {
    Get.toNamed(AppRoutes.addressView);
  }

  @override
  void onInit() {
    userEmail = myServices.shared!.getString("email",);
    userName = myServices.shared!.getString("username",);
    userPhone= myServices.shared!.getString("phone",);
    super.onInit();
  }
}