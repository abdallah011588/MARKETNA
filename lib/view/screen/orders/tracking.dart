import 'package:e_commerce_app/controller/orders/tracking_controller.dart';
import 'package:e_commerce_app/view/widget/cart/appbar.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(TrackingController());
    return Scaffold(
      appBar:customAppBar("Order Tracking".tr),
      body: GetBuilder<TrackingController>(
          builder: (controller) {
            return HandlingDataView(
             requestStatus: controller.requestStatus,
             widget: Padding(
              padding: const EdgeInsets.all( 10.0),
              child: Card(
                 child: GoogleMap(
                   mapType: MapType.normal,
                   initialCameraPosition: controller.cameraPosition!,
                   markers: controller.markers,
                   onMapCreated: (GoogleMapController googleMapController){
                     controller.mapController = googleMapController;
                     // controller.mapController.complete(googleMapController);
                   },
                  // polylines: controller.polyLineSet,
                 ),
               ),
            ));
          }
      ),
    );
  }
}
