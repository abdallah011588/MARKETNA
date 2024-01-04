import 'package:e_commerce_app/controller/orders/order_details_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/cart/appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar:customAppBar("Order Details".tr),
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) {
          return HandlingDataView(requestStatus: controller.requestStatus, widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Table(
                        children: [
                          TableRow(
                              children: [
                                Text("Product".tr,textAlign: TextAlign.center,style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                                Text("Quantity".tr,textAlign: TextAlign.center,style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                                Text("Price".tr,textAlign: TextAlign.center,style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                              ]
                          ),
                          ...List.generate(controller.data.length, (index) =>
                              TableRow(
                                  children: [
                                    Text(controller.data[index]["product_name"] ,textAlign: TextAlign.center,),
                                    Text(controller.data[index]["count_products"].toString(),textAlign: TextAlign.center,),
                                    Text(controller.data[index]["product_price"].toString(),textAlign: TextAlign.center,),
                                  ]
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Text("Total price".tr+" :${controller.orderModel!.orderTotalPrice}\$",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                if(controller.orderModel!.orderType =="0")  Card(
                  child: ListTile(
                    title: Text(controller.orderModel!.addressName!),
                    subtitle: Text(controller.orderModel!.addressCity! + " - " + controller.orderModel!.addressStreet!),
                  ),
                ),
                const SizedBox(height: 20,),
                if(controller.orderModel!.orderType =="0") Card(
                  child: SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: controller.cameraPosition!,
                      markers: controller.markers,
                      onMapCreated: (GoogleMapController googleMapController){
                        controller.mapController.complete(googleMapController);
                      },

                      gestureRecognizers: {
                        Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer(),),
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                if(controller.orderModel!.orderType =="0" && controller.orderModel!.orderStatus =="3")
                  CustomButtonAuth(
                      onPressed: (){
                        controller.goToTracking();
                      },
                    text: "Track".tr,
                  ),
              ],
            ),
          ));
        }
      ),
    );
  }
}



/*

   Get.put(PendingController());
    return GetBuilder<PendingController>(builder: (controller) => HandlingDataView(
        requestStatus: controller.requestStatus,
        widget: ListView.builder(
          itemBuilder: (context, index) {
          return PendingCard(orderModel: controller.orders[index]);
        },
          itemCount: controller.orders.length,
        ),
    ),);

 */