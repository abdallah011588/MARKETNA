import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:e_commerce_app/view/widget/cart/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widget/cart/check_out_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(CartController());
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text("Your Cart".tr,style: const TextStyle(color: AppColors.black,fontSize: 25,),),
          centerTitle: true,
          bottom:  PreferredSize(child: Text("${controller.totalProductsCount} "+ "items".tr), preferredSize: const Size(5, 5)),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
            onTap: (){
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: HandlingDataView(
           requestStatus: controller.requestStatus,
           widget: NotificationListener<OverscrollIndicatorNotification>(
             onNotification: (overScroll){
               overScroll.disallowIndicator();
               return true;
             },
             child: ListView.builder(
               itemCount: controller.cartModel.length,
               itemBuilder: (context, index) => Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10),
                 child: Dismissible(
                   key: Key(controller.cartModel[index].productId.toString()),
                   direction: DismissDirection.endToStart,
                   onDismissed: (direction) {
                     controller.deleteAllCount(controller.cartModel[index].productId,controller.cartModel[index].countPrice!, index);
                   },
                   background: Container(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     decoration: BoxDecoration(
                       color: const Color(0xFFFFE6E6),
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: Row(
                       children: [
                         const Spacer(),
                         SvgPicture.asset("assets/icons/Trash.svg"),
                       ],
                     ),
                   ),
                   child: CartCard(
                     productCount: controller.cartModel[index].countProducts!.toString() ,
                     productPrice: controller.cartModel[index].countPrice.toString(),
                     productImage:"${AppLink.productImage}/${controller.cartModel[index].productImage!}",
                     onPressAdd: () async{
                       await controller.addCart(
                           controller.cartModel[index].productId.toString(),
                           controller.cartModel[index].productPrice!,
                           index
                       );
                       controller.refreshPage();
                     },
                     onPressRemove: () async{
                       await controller.removeCart(
                           controller.cartModel[index].productId.toString(),
                           controller.cartModel[index].productPrice!,
                           index
                       );
                       controller.refreshPage();
                     },
                     productName: translateDatabase(
                         controller.cartModel[index].productNameAr!,
                         controller.cartModel[index].productName!),
                   ),
                   /*  child:  CartCard(
                  // productCount: controller.cartModel[index].countProducts!.toString() ,
                  productCount: controller.productCount[index].toString() ,
                  productPrice: controller.productCountPrice[index].toString(),
                  productImage:"${AppLink.productImage}/${controller.cartModel[index].productImage!}",
                  onPressAdd: () async{
                   await controller.addCart(
                        controller.cartModel[index].productId.toString(),
                        controller.cartModel[index].productPrice!,
                        index
                    );
                  },
                  onPressRemove: () async{
                    await controller.removeCart(
                        controller.cartModel[index].productId.toString(),
                        controller.cartModel[index].productPrice!,
                        index
                    );
                  },
                  productName: translateDatabase(
                      controller.cartModel[index].productNameAr!,
                      controller.cartModel[index].productName!),
                ),*/
                 ),
               ),
             ),
           ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: CheckoutCard(
            controller: controller.cartController!,
            totalCost: controller.getTotalPrice().toString() ,//controller.totalPrice.toString() ,
            discount: controller.couponDisCount.toString(),
            shipping:"50",
            onPressedApply: () {
              controller.checkCoupon(controller.cartController!.text);
            },
            onPressedCheckout: () {
              controller.goToCheckout();
            },
          ),
        ),

      );
    },
    );
  }

}
