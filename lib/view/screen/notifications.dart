import 'package:e_commerce_app/controller/notifications_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications".tr,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
          onTap: (){
            Get.back();
          },
        ),
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return HandlingDataView(
           requestStatus: controller.requestStatus,
           widget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll){
                overScroll.disallowIndicator();
                return true;
              },
              child: ListView.builder(
                itemCount: controller.notificationModel.length,
                itemBuilder: (context, index) => ListTile(
                  // minVerticalPadding: 15,
                  style: ListTileStyle.drawer,
                  title: Text(
                    controller.notificationModel[index].notificationTitle!,
                    style: const TextStyle(color: AppColors.black),
                  ),
                  subtitle: Text(
                    controller.notificationModel[index].notificationBody!,
                    style: const TextStyle(color: AppColors.black),
                  ),
                  trailing: Text(
                    Jiffy(controller.notificationModel[index].notificationDateTime!,"yyyy-MM-dd h:mm:ss").fromNow(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          );
        }
      ),
    );
  }
}
