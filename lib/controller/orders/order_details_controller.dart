
import 'dart:async';

import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/data_source/remote/order_details.dart';
import 'package:e_commerce_app/data/model/order_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends GetxController
{

  late RequestStatus requestStatus;
  OrderDetailsData orderDetailsData =OrderDetailsData(Get.find());

  Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  CameraPosition? cameraPosition ;
  OrderModel? orderModel;
  Set<Marker> markers={};

  List data=[];

  initialData()
  {
    // requestStatus=RequestStatus.loading;
    if(orderModel!.orderType =="0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(orderModel!.addressLat!),
            double.parse(orderModel!.addressLong!)),
        zoom: 8,
      );
      markers.add(
        Marker(
          markerId: const MarkerId("1"),
          position: LatLng(double.parse(orderModel!.addressLat!),
              double.parse(orderModel!.addressLong!)),
        ),
      );
      // update();
      // requestStatus=RequestStatus.success;
    }
  }

  getOrderDetails()async
  {
    requestStatus =RequestStatus.loading;

    var response= await orderDetailsData.getData(orderModel!.orderId!);

    requestStatus =handlingData(response);

    if(RequestStatus.success == requestStatus)
      {
        if(response['status']=="success")
          {
            List listData = response['data'];
            data.addAll(listData.map((e) => e));
          }
        else{
          requestStatus=RequestStatus.failure;
        }
      }
    update();
  }

  goToTracking()
  {
    Get.toNamed(AppRoutes.tracking,arguments: {"orderModel":orderModel});
  }

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    initialData();
    getOrderDetails();
    super.onInit();
  }
}