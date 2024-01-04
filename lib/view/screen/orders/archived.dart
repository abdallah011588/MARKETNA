import 'package:e_commerce_app/controller/orders/archived_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/widget/order/order_archived.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Archived extends StatelessWidget {
  const Archived({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ArchivedController());
    return GetBuilder<ArchivedController>(builder: (controller) => HandlingDataView(
      requestStatus: controller.requestStatus,
      widget: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll){
          overscroll.disallowIndicator();
          return true;
        },
        child: ListView.builder(
        itemBuilder: (context, index) {
          return ArchivedCard(orderModel: controller.orders[index]);
        },
        itemCount: controller.orders.length,
      ),
      ),
    ),
    );
  }
}

/*
 Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order number : ${controller.orders[index].orderId}",
                            style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)),
                        Text("${Jiffy(controller.orders[index].orderDatetime,"yyyy-MM-dd h:mm:ss").fromNow()}",),
                      ],
                    ),
                    Divider(),
                    Text("Order Type : ${controller.getOrderType( controller.orders[index].orderType!)}",),
                    Text("Order Price : ${controller.orders[index].orderPrice}\$",),
                    Text("Delivery Price : ${controller.orders[index].orderDeliveryPrice}\$",),
                    Text("Payment method : ${controller.getPaymentType(controller.orders[index].orderPaymentMethod!)}",),
                    Text("Order Status : ${controller.getOrderStatus(controller.orders[index].orderStatus!)}",),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total price : ${controller.orders[index].orderTotalPrice}\$",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)),
                        Container(height:40 ,child: CustomButtonAuth(onPressed: (){}, text: "Details")),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )
 */