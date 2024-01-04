
import 'dart:async';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String apiKey="AIzaSyDQDpxSNGbJdyKqEhBgpEfxCJgjjYjVYkA";

class AddressController extends GetxController
{

   late RequestStatus requestStatus;
   Completer<GoogleMapController> controller = Completer<GoogleMapController>();
   CameraPosition kGooglePlex = const CameraPosition(
    target:  LatLng(30.033333, 31.233334),
    zoom: 14.4746,
  );

  CameraPosition? currentCameraPosition ;
  Position? currentLocation;
  var lat;
  var long;

  List<Marker> markers = [];

  addMarkers(LatLng latLng){
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"),position: latLng));
    lat =latLng.latitude ;
    long =latLng.longitude;
    update();
  }

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

  // Future<Position> getLatAndLong()async
  Future<void> getLatAndLong()async
  {
    requestStatus = RequestStatus.loading;
    currentLocation = await Geolocator.getCurrentPosition().then((value) => value);
    lat =currentLocation!.latitude ;
    long =currentLocation!.longitude;
    currentCameraPosition = CameraPosition(
      target: LatLng(lat,long),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
      bearing: 192.8334901395799,
    );
    requestStatus=RequestStatus.success;
   update();
  }

  Future<void> goToCurrentLocation() async {
    final GoogleMapController mapController = await controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition!));
  }

  @override
  void onInit() {
    getPosition();
    getLatAndLong();
    super.onInit();
  }

}