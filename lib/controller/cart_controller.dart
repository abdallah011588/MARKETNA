
import 'dart:developer';

import 'package:e_commerce_app/controller/myfavorite_controller.dart';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/cart_data.dart';
import 'package:e_commerce_app/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  late RequestStatus requestStatus ;
  List<CartModel> cartModel=[];

   double totalPrice=0;
   int totalProductsCount=0;
   int couponDisCount = 0;
   String? coupon_name;
   String? couponId;

   TextEditingController? cartController ;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // List<int> productCount = [];
  //List<int> productCountPrice = [];

  /// MY WAY TO PERFORM CART
 /*
  getAllFromCart( )async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.getAllFromCart( myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        cartModel=[];
        List cartResponse=response['cartData']['data'];
        cartModel.addAll(cartResponse.map((e) {
          productCount.add(e["count_products"]);
          productCountPrice.add(e["count_price"]);
          print(productCount);
          print(productCountPrice);
          return CartModel.fromJson(e);
        }));
        totalPrice=response["countAndPrice"]["total_price"];
        totalProductsCount=response["countAndPrice"]["total_count"];
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  addCart(String productId,int productPrice,int index )async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.addCart( productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        if(index !=-1)
          {
            productCount[index]++;
            productCountPrice[index]+=productPrice;
            //totalProductsCount++;
            totalPrice=totalPrice + productPrice;
          }
        Get.rawSnackbar(title: "Notification",messageText:const Text("Product is added to Cart"));
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  removeCart(String productId ,int productPrice, int index )async {

    if(index !=-1)
      {
        if(productCount[index]==1)
        {

          requestStatus = RequestStatus.loading;
          var response  = await cartData.removeCart( productId.toString() ,myServices.shared!.getString("id")!);
          requestStatus = handlingData(response);
          if(requestStatus == RequestStatus.success)
          {
            if(response['status']=="success")
            {
              productCount.removeAt(index);
              productCountPrice.removeAt(index);
              cartModel.removeAt(index);
              totalProductsCount--;
              totalPrice=totalPrice-productPrice;

              Get.rawSnackbar(title: "Notification",messageText:const Text("Product is removed from cart"));
            }
            else
            {
              requestStatus = RequestStatus.failure;
            }
          }
        }
        else if(productCount[index]>0)
        {
          requestStatus = RequestStatus.loading;
          var response  = await cartData.removeCart( productId.toString() ,myServices.shared!.getString("id")!);
          requestStatus = handlingData(response);
          if(requestStatus == RequestStatus.success)
          {
            if(response['status']=="success")
            {
              productCount[index]--;
             // totalProductsCount--;
              totalPrice=totalPrice-productPrice;
              productCountPrice[index]-=productPrice;

              Get.rawSnackbar(title: "Notification",messageText:const Text("Product is removed from cart"));
            }
            else
            {
              requestStatus = RequestStatus.failure;
            }
          }
        }

      }
    else
      {
          requestStatus = RequestStatus.loading;
          var response  = await cartData.removeCart( productId.toString() ,myServices.shared!.getString("id")!);
          requestStatus = handlingData(response);
          if(requestStatus == RequestStatus.success)
          {
            if(response['status']=="success")
            {
              productCount[index]--;
              Get.rawSnackbar(title: "Notification",messageText:const Text("Product is removed from cart"));
            }
            else
            {
              requestStatus = RequestStatus.failure;
            }
          }

      }

    update();
  }

  deleteAllCount( productId ,int countPrice,int index )async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.deleteAllCountCart( productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        productCount.removeAt(index);
        cartModel.removeAt(index);
        print(countPrice);
        totalPrice -=productCountPrice[index];
        totalProductsCount--;
        Get.rawSnackbar(title: "Notification",messageText:const Text("Product is removed from cart"));
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();

  }
*/

  /// Second WAY TO PERFORM CART
  getAllFromCart( )async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.getAllFromCart( myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        //cartModel=[];
        List cartResponse=response['cartData']['data'];
        cartModel.addAll(cartResponse.map((e) =>CartModel.fromJson(e)));
        totalPrice= double.parse (response["countAndPrice"]["total_price"].toString());
        totalProductsCount=response["countAndPrice"]["total_count"];
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  addCart(String productId,int productPrice,int index )async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.addCart( productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
       // Get.rawSnackbar(title: "Notification",messageText:const Text("Product is added to Cart"));
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  removeCart(String productId ,int productPrice, int index )async {

      requestStatus = RequestStatus.loading;
      var response  = await cartData.removeCart( productId.toString() ,myServices.shared!.getString("id")!);
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success)
      {
        if(response['status']=="success")
        {
          // Get.rawSnackbar(title: "Notification",messageText:const Text("Product is removed from cart"));
        }
        else
        {
          requestStatus = RequestStatus.failure;
        }
      }


    update();
  }

  deleteAllCount( productId ,double countPrice,int index )async {
    requestStatus = RequestStatus.loading;
    var response  = await cartData.deleteAllCountCart( productId.toString() ,myServices.shared!.getString("id")!);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        totalPrice -=cartModel[index].countPrice!;
        cartModel.removeAt(index);
        print(countPrice);
        totalProductsCount--;
        if(cartModel.isEmpty)
          {
            requestStatus=RequestStatus.failure;
          }
      //  Get.rawSnackbar(title: "Notification",messageText:const Text("Product is removed from cart"));
      }
      else
      {
        requestStatus = RequestStatus.failure;
      }
    }
    update();

  }

  resetVarCart()
  {
    // totalPrice=0;
    //  totalProductsCount=0;
    cartModel.clear();

  }

  refreshPage()
  {
    resetVarCart();
    getAllFromCart();
  }

  checkCoupon( String couponName )async {

    if(cartModel.isEmpty)
    {
      Get.snackbar("Warning".tr, "Cart is empty !".tr);
      cartController!.clear();
    }
    else{
      // if (formKey.currentState!.validate()) {
      if (cartController!.text.isNotEmpty) {
        requestStatus = RequestStatus.loading;
        var response = await cartData.checkCoupon(couponName);
        update();
        requestStatus = handlingData(response);
        if (requestStatus == RequestStatus.success) {
          if (response['status'] == "success") {
            coupon_name = response['data']['coupon_name'].toString();
            couponId = response['data']['coupon_id'].toString();
            couponDisCount =response['data']['coupon_discount'];
            cartController!.clear();
          }
          if (response['status'] == "failure") {
            couponDisCount = 0;
            coupon_name = null;
            couponId = null;
            cartController!.clear();
            print("failure");
            Get.snackbar("Warning".tr, "Coupon is not valid or expired".tr);
            // requestStatus = RequestStatus.none;
          }
        }
        update();
      }
    }

  }

  double getTotalPrice()
  {
    return totalPrice- ((couponDisCount) * totalPrice /100);
  }

 void goToCheckout()
  {
    if(cartModel.isEmpty)
    {
      Get.snackbar("Warning".tr, "Cart is empty !".tr);
    }
    else
    {
        Get.toNamed(AppRoutes.checkout,arguments: {
          "order_price": totalPrice,
          "coupon_id":couponId ==null?  "0" : couponId.toString() ,
          "coupon_discount":couponDisCount,
        });
        log("***${totalPrice.toString()}");
        log("${couponId.toString()}");
        log("${couponDisCount.toString()}");
      }
  }


  @override
  void onInit() async{
    cartController=TextEditingController();
    getAllFromCart();
    // productCount = await getCount(productModel.productId);
    super.onInit();
  }
@override
  void dispose() {
    cartController!.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    /// //////////////////////////
    MyFavoriteController f=Get.put(MyFavoriteController());
    f.getAllFavorite();
    super.onClose();
  }
}