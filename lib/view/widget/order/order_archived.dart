
import 'package:e_commerce_app/controller/orders/archived_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/data/model/order_model.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ArchivedCard extends GetView<ArchivedController> {
  final OrderModel orderModel;
  const ArchivedCard( {Key? key ,required this.orderModel}) : super(key: key);

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
                             // controller.deleteOrder(orderModel.orderId!,orderModel.orderStatus!);
                            },
                            value: 'Delete',
                            child: Text(
                              'Delete'.tr,
                              style:const TextStyle(color: Colors.black,),
                            ),
                          ),
                          DropdownMenuItem(
                            onTap: (){
                            },
                            value: 'rate',
                            child: Text(
                              'Rate Us'.tr,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total price".tr+" : ${orderModel.orderTotalPrice}\$",
                      style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)
                  ),
                  SizedBox(height:40 ,child: CustomButtonAuth(onPressed: (){
                    controller.goToOrderDetails(orderModel);
                  }, text: "Details".tr)),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(),

              InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) =>  RatingDialog(
                      initialRating: 0.0,
                      title: Text(
                        'Order Rating'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      message: Text(
                        'Tap a star to set your rating. Add more description here if you want.'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                      image: Image.asset("assets/images/rate2.png",height: 200,),
                      submitButtonText: 'Submit'.tr,
                      commentHint: 'Set your custom feedback hint'.tr,
                      onCancelled: () {},
                      onSubmitted: (response) {
                          controller.submitRating(orderModel.orderId!, response.rating, response.comment);
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rate Us".tr,
                        style: const TextStyle(color: AppColors.black,fontSize: 18),
                      ),
                      SizedBox(
                        width: 70,
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return SvgPicture.asset(
                              AppImageAsset.star,
                              color: int.parse(orderModel.orderRating!)>=(index+1)? Colors.amber: AppColors.lightGery,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
