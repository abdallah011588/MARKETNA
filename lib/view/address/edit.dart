
import 'package:e_commerce_app/controller/address_edit_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String apiKey="AIzaSyDQDpxSNGbJdyKqEhBgpEfxCJgjjYjVYkA";

class EditAddress extends StatelessWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressEditController());
    return GetBuilder<AddressEditController>(
      builder:(addressEditController)=> Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text("Edit Address".tr,style: const TextStyle(color: AppColors.black,fontSize: 22,),),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
            onTap: (){
              Get.back();
            },
          ),
          actions: [
            IconButton(
              onPressed:(){
                addressEditController.goToCurrentLocation();
              },
              icon:const Icon(Icons.my_location,color: AppColors.black,),
              splashRadius: 20,
            ),
          ],
        ),
        body:HandlingDataView(
            requestStatus: addressEditController.requestStatus,
            widget: addressEditController.currentCameraPosition !=null? GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:addressEditController.currentCameraPosition! ,
              markers:addressEditController.markers.isNotEmpty?
              addressEditController.markers.toSet()
                  :{
                Marker(markerId: const MarkerId("1"),position:LatLng(
                  addressEditController.lat,
                  addressEditController.long,),
                ),
              },

              onMapCreated: (GoogleMapController controller) {
                addressEditController.controller.complete(controller);
              },
              onTap: (latLng){
                addressEditController.addMarkers(latLng);
              },
            )
                :const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){addressEditController.goToAddressDetails();},
          label: Text('Continue'.tr),
          icon: const Icon(Icons.navigate_next),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
