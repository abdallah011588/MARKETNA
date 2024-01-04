
import 'package:e_commerce_app/controller/orders/pending_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/data/model/order_model.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PendingCard extends GetView<PendingController> {
  final OrderModel orderModel;
  const PendingCard( {Key? key ,required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Number".tr+" : ${orderModel.orderId}",
                        style:const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.primaryColor),
                    ),
                  ),
                  Text(Jiffy(orderModel.orderDatetime,"yyyy-MM-dd h:mm:ss").fromNow(),),
                  SizedBox(

                    child: DropdownButton(
                        underline:const SizedBox(),
                        icon: const Icon(
                          Icons.more_vert,
                          color: AppColors.black,
                        ),
                        items: [
                          DropdownMenuItem(
                            onTap: (){
                              controller.deleteOrder(orderModel.orderId!,orderModel.orderStatus!);
                            },
                            value: 'Delete',
                            child: Text(
                              'Delete'.tr,
                              style:const TextStyle(color: Colors.black,),
                            ),
                          ),
                        ],
                        onChanged: (value){
                        }
                    ),
                  ),
                ],
              ),
              const Divider(),
              Text("Order Type".tr+" : ${controller.getOrderType( orderModel.orderType!)}",),
              Text("Order Price".tr+" : ${orderModel.orderPrice}\$",),
              Text("Delivery Price".tr+" : ${orderModel.orderDeliveryPrice}\$",),
              Text("Payment Method".tr+" : ${controller.getPaymentType(orderModel.orderPaymentMethod!)}",),
              Text("Order Status".tr+" : ${controller.getOrderStatus(orderModel.orderStatus!)}",),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total price".tr+" : ${orderModel.orderTotalPrice}\$",style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)),
                  SizedBox(height:40 ,child: CustomButtonAuth(onPressed: (){
                    controller.goToOrderDetails(orderModel);
                  }, text: "Details".tr)),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
