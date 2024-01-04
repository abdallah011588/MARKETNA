import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/view/widget/product_details/product_image_stack.dart';
import 'package:e_commerce_app/view/widget/product_details/product_price_and_review.dart';
import 'package:e_commerce_app/view/widget/product_details/subitems_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            child: MaterialButton(
              onPressed: () {
                controller.addCart();
              },
              child: Text("Add to cart".tr,style:  const TextStyle(color: AppColors.lightGery2,fontSize: 20,fontWeight: FontWeight.bold),),
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              height: 50,
            ),
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child:  ListView(
              children: [
                const ProductImageStack(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.productModel.productDiscount!.toInt() >0?
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: controller.productModel.productPriceDiscount!.toString()=="null"?
                              "${(controller.productModel.productPrice! -(controller.productModel.productPrice!*controller.productModel.productDiscount!/100)).toInt()}"
                                  :controller.productModel.productPriceDiscount!.toString(),
                              style: const TextStyle(
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const TextSpan(
                              text: "  ",
                            ),
                            TextSpan(
                              text: controller.productModel.productPrice!.toString(),
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                height: 1.5,
                                fontSize: 17,
                                color: AppColors.lightGery,
                              ),
                            ),
                          ],),
                      )
                          :Text(
                        controller.productModel.productPrice!.toString(),
                        style:const TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Product_priceAndReview(name: translateDatabase(
                          controller.productModel.productNameAr,
                          controller.productModel.productName),
                      ),
                      const SizedBox(height: 10,),
                      Text( "Color Option".tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1!.copyWith(fontSize: 18,fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SubItemsList(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                splashRadius: 25,
                                onPressed: (){
                                  controller.removeCart();
                                },
                                icon: const Icon(Icons.remove_circle_outline,color: AppColors.grey,size: 30,),
                              ),
                              const SizedBox(width: 5,),
                              Text(controller.productCount.toString()),
                              const SizedBox(width: 5,),
                              IconButton(
                                splashRadius: 25,
                                onPressed: (){
                                  controller.addCart();
                                },
                                icon:const Icon(Icons.add_circle_outline,color: AppColors.grey,size: 30,),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text( "Description".tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1!.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        translateDatabase(
                            controller.productModel.productDescriptionAr,
                            controller.productModel.productDescription),
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(height: 1.6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }


}
