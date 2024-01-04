
import 'dart:async';

import 'package:e_commerce_app/controller/address_view_latlng_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressViewLatLng extends StatelessWidget {
  AddressModel? addressModel;
  AddressViewLatLng({Key? key, this.addressModel}) : super(key: key);
  Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewLatLngController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title:  Text("Address".tr,style: const TextStyle(color: AppColors.black,fontSize: 22,),),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
          onTap: (){
            Get.back();
          },
        ),
      ),
      body: GetBuilder<AddressViewLatLngController>(
        builder: (pageController) {
          return HandlingDataView(
              requestStatus: pageController.requestStatus,
              widget:pageController.currentCameraPosition !=null?
              GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: pageController.currentCameraPosition!,
            markers: pageController.markers.toSet(),
            onMapCreated: (GoogleMapController controller){
              pageController.controller.complete(controller);
            },
          )
                  :const CircularProgressIndicator(),
          );
        }
      ),
    );
  }


}

