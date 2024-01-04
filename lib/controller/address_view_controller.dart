
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController
{

  RequestStatus requestStatus= RequestStatus.loading;
  AddressData addressData = AddressData(Get.find());
  MyServices services= Get.find();
  List<AddressModel> addresses=[];

   goToViewAddressLatLng(String lat ,String long){
     Get.toNamed(AppRoutes.addressViewLatLng,arguments: {
       "lat": lat,
       "long": long
     });

   }

  goToEditAddressLatLng(String lat ,String long , AddressModel addressModel){
    print("edit1");
    Get.toNamed(AppRoutes.addressEdit,arguments: {
      "lat": lat,
      "long": long,
      "addressModel": addressModel
    });

  }


   getAddresses()async{

      requestStatus = RequestStatus.loading;
      var response  = await addressData.getData(services.shared!.getString("id")!,);
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success)
      {
        if(response['status']=="success")
        {
          addresses=[];
          List dataList=response['data'];
          addresses.addAll(dataList.map((e) => AddressModel.fromJson(e)));
          print(addresses);
        }
        else
        {
          requestStatus = RequestStatus.failure;
        }
      }
      update();

  }

  deleteAddress(String addressId){
    addressData.deleteData(addressId);
    addresses.removeWhere((element) => element.addressId==addressId);
    update();
  }


  @override
  void onInit() {
    getAddresses();
    super.onInit();
  }


  @override
  void dispose() {
    super.dispose();
  }
}