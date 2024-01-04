
import 'package:e_commerce_app/controller/address_view_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:e_commerce_app/view/widget/cart/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class AddressView extends StatelessWidget {
//    AddressView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(AddressViewController());
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: customAppBar("Addresses"),
//       body: GetBuilder<AddressViewController>(
//         builder: (controller) {
//          return HandlingDataView(
//             requestStatus: controller.requestStatus,
//            widget:controller.addresses !=null? ListView.separated(
//             separatorBuilder:(context, index) => SizedBox(height: 10,),
//             itemBuilder:(context ,index)=>AddressCard(
//               addressModel: controller.addresses[index],
//               onDelete: (){
//                 controller.deleteAddress(controller.addresses[index].addressId!);
//               },
//               onTap: (){
//                 controller.goToViewAddressLatLng(
//                     controller.addresses[index].addressLat!.toString(),
//                     controller.addresses[index].addressLong!);
//               },
//
//               onEdit: (){
//                 controller.goToEditAddressLatLng(
//                   controller.addresses[index].addressLat.toString(),
//                   controller.addresses[index].addressLat.toString(),
//                 );
//               },
//
//             ) ,
//             itemCount: controller.addresses.length,
//            ):CircularProgressIndicator(),
//           );
//         }
//       ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: (){
//          Get.toNamed(AppRoutes.addressAdd);
//        },
//        child: Icon(Icons.add),),
//     );
//   }
//
//
// }


class AddressView extends StatelessWidget {
   AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar("Addresses".tr),
      body: GetBuilder<AddressViewController>(
        builder: (controller) {
         return HandlingDataView(
            requestStatus: controller.requestStatus,
           widget:controller.addresses !=null? ListView.separated(
            separatorBuilder:(context, index) => const SizedBox(height: 10,),
            itemBuilder:(context ,index){

            return  Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(controller.addresses[index].addressName!),
                    subtitle: Text(controller.addresses[index].addressCity! + " - " + controller.addresses[index].addressStreet!),
                    trailing: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                          underline:const SizedBox(),
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppColors.black,
                          ),
                          items: [
                            DropdownMenuItem(
                              onTap:()=>controller.deleteAddress(controller.addresses[index].addressId!),
                              value: 'Delete',
                              child: Text(
                                'Delete'.tr,
                                style:const TextStyle(color: Colors.black,),
                              ),
                            ),
                            DropdownMenuItem(
                              onTap:(){},
                              value: 'Edit',
                              child: Text(
                                'Edit'.tr,
                                style:const TextStyle(color: Colors.black,),
                              ),
                            ),
                          ],
                          onChanged: (value){
                            if(value=="Edit")
                            {
                              controller.goToEditAddressLatLng(
                                controller.addresses[index].addressLat.toString(),
                                controller.addresses[index].addressLong.toString(),
                                controller.addresses[index],
                              );
                            }

                          }
                      ),
                    ),
                    onTap:()=> controller.goToViewAddressLatLng(
                        controller.addresses[index].addressLat!.toString(),
                        controller.addresses[index].addressLong!),
                  ),
                ),
              );
              },
            itemCount: controller.addresses.length,
           ):const CircularProgressIndicator(),
          );
        }
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         Get.toNamed(AppRoutes.addressAdd);
       },
       child: const Icon(Icons.add),),
    );
  }


}

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;
  final  onTap;
  final  onDelete;
  final  onEdit;
  const AddressCard({Key? key,required this.addressModel, this.onTap, this.onDelete, this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text(addressModel.addressCity! + " - " + addressModel.addressStreet!),
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                underline:const SizedBox(),
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.black,
                ),
                items: [
                  DropdownMenuItem(
                    onTap:onDelete,
                    value: 'Delete',
                    child: Text(
                      'Delete'.tr,
                      style:const TextStyle(color: Colors.black,),
                    ),
                  ),
                  DropdownMenuItem(
                    onTap:()=> onEdit,
                    value: 'Edit',
                    child: Text(
                      'Edit'.tr,
                      style:const TextStyle(color: Colors.black,),
                    ),
                  ),
                ],
                onChanged: (value){
                }
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
