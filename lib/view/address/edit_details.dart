import 'package:e_commerce_app/controller/address_edit_details_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/validator.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddressEditDetails extends StatelessWidget {
  const AddressEditDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressEditDetailsController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title:  Text("Edit Details".tr,style: const TextStyle(color: AppColors.black,fontSize: 22,),),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
          onTap: (){
            Get.back();
          },
        ),
      ),
      body: GetBuilder<AddressEditDetailsController>(
        builder: (controller)=>Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                CustomTextFormField(
                  label: "Name".tr,
                  hint: "Address name".tr,
                  suffixIcon: Icons.title,
                  controller: controller.addressNameController,
                  valid: (val) {
                    return validInput(val!, 5, 100, "Address name");
                  },
                  keyBoardType: TextInputType.text,
                ),
                const SizedBox(height: 15,),
                CustomTextFormField(
                  label: "City".tr,
                  hint: "City name".tr,
                  suffixIcon: Icons.location_city,
                  controller: controller.addressCityController,
                  valid: (val) {
                    return validInput(val!, 5, 100, "City name");
                  },
                  keyBoardType: TextInputType.text,
                ),
                const SizedBox(height: 15,),
                CustomTextFormField(
                  label: "Street".tr,
                  hint: "Street name".tr,
                  suffixIcon: Icons.streetview,
                  controller: controller.addressStreetController,
                  valid: (val) {
                    return validInput(val!, 5, 100, "Street name");
                  },
                  keyBoardType: TextInputType.text,
                ),
                const SizedBox(height: 15,),
                CustomButtonAuth(
                  onPressed: (){
                    controller.saveAddress();
                  },
                  text: "Save".tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
