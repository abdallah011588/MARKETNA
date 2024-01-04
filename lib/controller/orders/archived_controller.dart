

import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/orders_data.dart';
import 'package:e_commerce_app/data/model/order_model.dart';
import 'package:get/get.dart';

class ArchivedController extends GetxController
{
  OrdersData ordersData = OrdersData(Get.find());
  late RequestStatus requestStatus ;
  MyServices myServices=Get.find();
  List<OrderModel> orders=[];

  getData()async{
    requestStatus = RequestStatus.loading;
    update();
    var response  = await ordersData.getArchivedData(myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
        if(response['status']=="success")
          {
            orders=[];
            List dataList=response['data'];
            orders.addAll(dataList.map((e) => OrderModel.fromJson(e)));
          }
        else
          {
            requestStatus = RequestStatus.failure;
          }
      }
    update();

  }


  String getOrderType(String type)
  {
    if(type=="0") return "Delivery".tr;
    else return "Receive".tr;
  }

  String getPaymentType(String type)
  {
    if(type=="0") return "Cash".tr;
    else return "Payment card".tr;
  }

  String getOrderStatus(String type)
  {
    if(type=="0") return "Under review".tr;
    if(type=="1") return "Order is being prepared".tr;
    if(type=="2") return "Order is being delivered".tr;
    else return "Archived".tr;
  }


  void goToOrderDetails(OrderModel orderModel)
  {
    Get.toNamed(AppRoutes.orderDetails,arguments: {
      "orderModel":orderModel,
    });
  }


  submitRating(String orderId ,double rating ,String feedback)async{
    requestStatus =RequestStatus.loading;
    update();
    if (rating == 0.0) {
      Get.snackbar("Waring".tr, "Your rating can't be 0 ".tr);
    }
    else{
      var response=await ordersData.ratingData(myServices.shared!.getString("id")!, orderId, rating, feedback);
      requestStatus =handlingData(response);
      if(requestStatus==RequestStatus.success)
      {
        if(response['status']=="success")
        {
          Get.snackbar("Success".tr, "Your rating was sent ,Thank you".tr);
          getData();
        }
        else
        {
          Get.snackbar("Failure".tr, "Something went wrong".tr);
        }
      }
    }
    update();
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }

}
