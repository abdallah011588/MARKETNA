import 'package:e_commerce_app/controller/profile_controller.dart';
import 'package:e_commerce_app/view/widget/profile/profile_menu.dart';
import 'package:e_commerce_app/view/widget/profile/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Center(
     child: NotificationListener<OverscrollIndicatorNotification>(
       onNotification: (overScroll){
         overScroll.disallowIndicator();
         return true;
       },
       child:ListView(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: controller.userName!,
            icon: "assets/icons/user_icon.svg",
            press: (){},
          ),
          ProfileMenu(
            text: controller.userPhone! ,
            icon: "assets/icons/Call.svg",
            press: () {},
          ),
          ProfileMenu(
            text:controller.userEmail!,
            icon: "assets/icons/Mail.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Orders".tr,
            icon: "assets/icons/orders.svg",
            press: () {
              controller.goToOrdersScreen();
            },
          ),
          ProfileMenu(
            text: "Addresses".tr,
            icon: "assets/icons/Location point.svg",
            press: () {
              controller.goToAddressScreen();
            },
          ),
          ProfileMenu(
            text: "Help Center".tr,
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Logout".tr,
            icon: "assets/icons/Log out.svg",
            press: () {
              Get.defaultDialog(
                title: "Information".tr,
                middleText: "Do you want to log out",
                actions: <Widget>[
                  TextButton(
                    child: Text("Yes".tr),
                    onPressed: () {
                      controller.logOut();
                    },
                  ),
                  TextButton(
                    child: Text("Close".tr),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ));
  }
}
