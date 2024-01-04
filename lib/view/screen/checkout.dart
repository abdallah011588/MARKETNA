import 'package:e_commerce_app/controller/checkout_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/checkout/delivery_type_card.dart';
import 'package:e_commerce_app/view/widget/checkout/payment_method_card.dart';
import 'package:e_commerce_app/view/widget/checkout/shipping_address_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController= Get.put(CheckoutController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title:  Text("Check Out".tr,style: const TextStyle(color: AppColors.black,fontSize: 25,),),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
          onTap: (){
            Get.back();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
        child: CustomButtonAuth(
            onPressed: (){
              checkoutController.checkout();
            },
          text: "Check Out".tr,
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(requestStatus: controller.requestStatus, widget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20.0),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                 Text(
                    "Choose payment method".tr,
                    style: const TextStyle(color: AppColors.black,fontWeight: FontWeight.bold, fontSize: 22,)
                ),

                const SizedBox(height: 10,),

                InkWell(
                  onTap: (){
                    controller.choosePaymentMethod("0");
                  },
                  child: PaymentMethodCard(
                    title: "Cash".tr,
                    svgIcon: "assets/icons/Cash.svg",
                    isActive:controller.choosePayment=="0"? true:false,
                  ),
                ),

                const SizedBox(height: 10,),

                InkWell(
                    onTap: (){
                      controller.choosePaymentMethod("1");
                    },
                    child: PaymentMethodCard(
                      title: "Payment Card".tr,
                      svgIcon: "assets/icons/credit.svg",
                      isActive: controller.choosePayment=="1"? true:false,
                    )),

                const SizedBox(height: 20,),

                 Text(
                    "Choose Delivery Type".tr,
                    style: const TextStyle(color: AppColors.black,fontWeight: FontWeight.bold, fontSize: 22,)
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          controller.chooseDeliveryType("0");
                        },
                        child: DeliveryTypeCard(title: "Delivery".tr, svgIcon: "assets/icons/delivery2.svg", isActive: controller.deliveryType=="0"?true:false, onPressed: (){})),
                    const SizedBox(width: 15,),
                    InkWell(
                        onTap: (){
                          controller.chooseDeliveryType("1");
                        },
                        child: DeliveryTypeCard(title: "Receive".tr, svgIcon: "assets/icons/drive_thru.svg", isActive:controller.deliveryType=="1"?true :false, onPressed: (){})),
                  ],
                ),

                const SizedBox(height: 10,),

                if(controller.deliveryType=="0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                          "Shipping Address".tr,
                          style: const TextStyle(color: AppColors.black,fontWeight: FontWeight.bold, fontSize: 22,)
                      ),
                      const SizedBox(height: 10,),
                      if(controller.addresses.isNotEmpty) ...List.generate(
                        controller.addresses.length,
                        (index) => ShippingAddressCard(
                          addressTitle: controller.addresses[index].addressName!,
                          addressDetails: "${controller.addresses[index].addressCity!} - ${controller.addresses[index].addressStreet!}",
                          isActive: controller.addressId == controller.addresses[index].addressId! ?  true : false ,
                          onPressed: (){
                            controller.chooseShippingAddress(controller.addresses[index].addressId!);
                          },
                        ),
                      ),
                      if(controller.addresses.isEmpty) Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Please add shipping address".tr,style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.black
                          ),),
                          SizedBox(
                            height: 40,
                            width: 80,
                            child: CustomButtonAuth(onPressed: (){
                              controller.goToAddAddress();
                            }, text: "Add".tr),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
