import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/orders_data.dart';
import 'package:e_commerce_app/data/model/order_model.dart';
import 'package:get/get.dart';

class PendingController extends GetxController
{
  OrdersData ordersData = OrdersData(Get.find());
  MyServices myServices=Get.find();
  late RequestStatus requestStatus ;
  List<OrderModel> orders=[];

  getData()async{
    requestStatus = RequestStatus.loading;
    update();
    var response  = await ordersData.getPendingData(myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
      {
        if(response['status']=="success")
          {
            List dataList=response['data'];
            orders=[];
            orders.addAll(dataList.map((e) => OrderModel.fromJson(e)));
          }
        else
          {
            requestStatus = RequestStatus.failure;
          }
      }
    update();
  }


  deleteOrder(String orderId ,String message)async{
    requestStatus = RequestStatus.loading;
    update();
    var response  = await ordersData.deleteData(orderId);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
      {
        if(response['status']=="success")
          {
            getData();
          }
        else
          {
            Get.snackbar("Warning", "Status: ${getOrderStatus(message)}");
            requestStatus = RequestStatus.none;
          }
      }
    update();
  }

  refreshOrder(){
    getData();
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
    if(type=="2") return "Ready to be delivered".tr;
    if(type=="3") return "Order is being delivered".tr;
    else return "Archived".tr;
  }

  void goToOrderDetails(OrderModel orderModel)
  {
    Get.toNamed(AppRoutes.orderDetails,arguments: {
      "orderModel":orderModel,
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

}
