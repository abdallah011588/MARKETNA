
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEditDetailsController extends GetxController
{

   RequestStatus requestStatus= RequestStatus.loading;
  String? lat;
  String? long;
  AddressModel? addressModel;
  AddressData addressData = AddressData(Get.find());
  MyServices services= Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController  addressNameController;
  late TextEditingController  addressCityController;
  late TextEditingController  addressStreetController;


  saveAddress()async{
    if(formKey.currentState!.validate())
      {
        requestStatus = RequestStatus.loading;
        var response  = await addressData.editData
          (
           addressModel!.addressId.toString(),
           addressNameController.text,
           addressCityController.text,
           addressStreetController.text,
           lat!,
           long!,
        );

        requestStatus = handlingData(response);
        if(requestStatus == RequestStatus.success)
        {
          if(response['status']=="success")
          {
            Get.offAllNamed(AppRoutes.homePage,);
            Get.snackbar("Address".tr, "Address is edited successfully".tr);
          }
          else
          {
            Get.dialog(
                AlertDialog(
                  title: Text("Warning".tr),
                  content: Text("Something went wrong".tr),)
            );
            requestStatus = RequestStatus.failure;
          }
        }
        update();
      }
  }


  @override
  void onInit() {
    addressModel=Get.arguments['addressModel'];
    addressNameController =TextEditingController(text: addressModel!.addressName);
    addressCityController =TextEditingController(text: addressModel!.addressCity);
    addressStreetController =TextEditingController(text: addressModel!.addressStreet);
     lat=Get.arguments['lat'];
     long=Get.arguments['long'];
    // print(lat);
    // print(long);
    super.onInit();
  }


  @override
  void dispose() {
    addressStreetController.dispose();
    addressCityController.dispose();
    addressNameController.dispose();
    super.dispose();
  }
}