import 'dart:developer';

import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/address_data.dart';
import 'package:e_commerce_app/data/data_source/remote/checkout_data.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController
{
  AddressData addressData=Get.put(AddressData(Get.find()));
  CheckoutData checkoutData=Get.put(CheckoutData(Get.find()));
  MyServices myServices=Get.find();
  String? choosePayment ;
  String? deliveryType ;
  String addressId = "0";
  late String couponId ;
  late String orderPrice ;
  late String couponDiscount ;
  List<AddressModel> addresses = [];
  late RequestStatus requestStatus ;
  choosePaymentMethod(String type)
  {
    choosePayment=type;
    update();
  }


  chooseDeliveryType(String type)
  {
    deliveryType=type;
    update();
  }

  getShippingAddresses()async{

    requestStatus = RequestStatus.loading;
    var response  = await addressData.getData(myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        List data = response['data'];
        addresses.addAll(data.map((e) => AddressModel.fromJson(e)));
      }
      else
      {
        //requestStatus = RequestStatus.failure;
      }
    }
    update();

  }

  chooseShippingAddress(String address_id)
  {
    addressId = address_id;
    update();
  }

  checkout()async{
    if(choosePayment ==null) {
      Get.snackbar("Warning".tr, "Please choose payment method ".tr);
    }
    else if(deliveryType ==null )
    {
    Get.snackbar("Warning".tr, "Please select delivery type".tr);
    }
    else if(addressId =="0" && deliveryType =="0"&& addresses .isNotEmpty)
    {
    Get.snackbar("Warning".tr, "Please select shipping address".tr);
    }
    else if(addressId =="0" && deliveryType =="0" && addresses .isEmpty)
    {
    Get.snackbar("Warning".tr, "Please add shipping address".tr);
    }

    else if(choosePayment!=null && ( (deliveryType =="0" && addressId !=null) || (deliveryType =="1" ) )  )
    {
    Map data={
      "user_id": myServices.shared!.getString("id")!,
      "address_id": addressId.toString(),
      "order_type": deliveryType.toString(),
      "delivery_price": "10",
      "order_price": orderPrice.toString(),
      "coupon_id": couponId,
      "coupon_discount": couponDiscount.toString(),
      "payment_method": choosePayment.toString(),
      "order_total_price": orderPrice.toString(),
    };


    log("ddd"+orderPrice);
    log("ddd"+couponId);
    log("ddd"+couponDiscount);
    requestStatus = RequestStatus.loading;
    update();
    var response  = await checkoutData.checkout(data);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        Get.snackbar("Success".tr, "Order is under review".tr);
        Get.offAllNamed(AppRoutes.homePage);
      }
      else
      {
        requestStatus = RequestStatus.none;
        Get.snackbar("Error".tr, "Try again".tr);
      }
    }
    update();
   }

  }

  goToAddAddress()
  {
    Get.toNamed(AppRoutes.addressAdd);
  }

  @override
  void onInit() {
    orderPrice=""+Get.arguments['order_price'].toString();
    couponId=Get.arguments['coupon_id'].toString();
    couponDiscount=Get.arguments['coupon_discount'].toString();
    getShippingAddresses();
    super.onInit();
  }
}