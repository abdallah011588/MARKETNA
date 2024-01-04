
import 'dart:async';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String apiKey="AIzaSyDQDpxSNGbJdyKqEhBgpEfxCJgjjYjVYkA";

class AddressViewLatLngController extends GetxController
{

   late RequestStatus requestStatus;
   Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  CameraPosition? currentCameraPosition ;
  double? lat;
  double? long;

  List<Marker> markers=[];

  goToAddressDetails(){
    Get.toNamed(AppRoutes.addressDetails,arguments: {
      "lat": lat.toString(),
      "long": long.toString()
    });

  }

  Future getPosition()async
  {
    bool? service;
    LocationPermission locationPer;
    service = await Geolocator.isLocationServiceEnabled();

    if(!service)
    {
      Get.defaultDialog(
        title: "Services".tr,
        content: Text("Location service is not enabled".tr) ,
      );
    }

    locationPer = await Geolocator.checkPermission();

    if(locationPer == LocationPermission.denied)
    {
      locationPer = await Geolocator.requestPermission();
    }
    if(locationPer == LocationPermission.always)
    {
      getLatAndLong();
    }
  }

  Future<void> getLatAndLong()async
  {
    requestStatus = RequestStatus.loading;
    lat =double.parse(Get.arguments['lat']);
    long = double.parse(Get.arguments['long']);
    currentCameraPosition = CameraPosition(
      target: LatLng(lat!,long!),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
      bearing: 192.8334901395799,
    );
    markers.add(Marker(markerId: MarkerId("1"),position: LatLng( lat!,long!)));
    requestStatus=RequestStatus.success;
   update();
  }


  @override
  void onInit() {
    getPosition();
    getLatAndLong();
    super.onInit();
  }

}