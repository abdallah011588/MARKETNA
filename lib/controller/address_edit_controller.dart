
import 'dart:async';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String apiKey="AIzaSyDQDpxSNGbJdyKqEhBgpEfxCJgjjYjVYkA";

class AddressEditController extends GetxController
{

   late RequestStatus requestStatus;
   Completer<GoogleMapController> controller = Completer<GoogleMapController>();
   CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 14.4746,
  );

  CameraPosition? currentCameraPosition ;
  Position? currentLocation;
  var lat;
  var long;
  AddressModel? addressModel;
  List<Marker> markers=[];

  addMarkers(LatLng latLng){
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"),position: latLng));
    lat =latLng.latitude ;
    long =latLng.longitude;
    update();
  }

  goToAddressDetails(){
    Get.toNamed(AppRoutes.addressEditDetails,arguments: {
      "addressModel": addressModel,
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
    currentLocation = await Geolocator.getCurrentPosition().then((value) => value);
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
    currentLocation = await Geolocator.getCurrentPosition();
    currentCameraPosition = CameraPosition(
      target: LatLng(currentLocation!.latitude,currentLocation!.longitude),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
      bearing: 192.8334901395799,
    );
    final GoogleMapController mapController = await controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition!));
    update();
  }

  @override
  void onInit() {
    print("lat******************");

    lat  = double.parse(Get.arguments['lat']);
    long = double.parse(Get.arguments['long']);
    addressModel = Get.arguments['addressModel'];
    print(lat);
    print(long);
    getPosition();
    getLatAndLong();
    super.onInit();
  }

}