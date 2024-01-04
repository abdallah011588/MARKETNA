

import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/notification_data.dart';
import 'package:e_commerce_app/data/data_source/remote/test_data.dart';
import 'package:e_commerce_app/data/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController
{
  NotificationData notificationData  = NotificationData(Get.find());
  late RequestStatus requestStatus ;
  MyServices myServices =Get.find();
  List<NotificationModel> notificationModel =[];
  getAllNotification()async{

    requestStatus = RequestStatus.loading;
    var response  = await notificationData.getData(myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
      {
        if(response['status']=="success")
          {
            List data =response['data'];
            notificationModel.addAll(data.map((e) => NotificationModel.fromJson(e)));
            print(data);
          }
        else
          {
            requestStatus = RequestStatus.failure;
          }
      }
    update();

  }

  @override
  void onInit() {
    getAllNotification();
    super.onInit();
  }

}
