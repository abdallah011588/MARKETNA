import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/offers_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomOfferProductGridView extends GetView<OffersController> {
  final ProductModel productModel;
  final bool addFavorite;
  const CustomOfferProductGridView( {Key? key, required this.productModel,required this.addFavorite,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productDetails,arguments: {"productModel":productModel});
        },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Hero(
                    tag: "${productModel.productId}",
                    child: CachedNetworkImage(
                      imageUrl: AppLink.productImage + "/" + productModel.productImage!,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text("Discount".tr,style:const TextStyle(color: AppColors.white,fontSize: 12),),
                    color: Colors.green,
                  ),
                ],
              ),
              Text(translateDatabase(productModel.productNameAr.toString(), productModel.productName.toString()),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColors.black),
              ),
              Expanded(
                child: Text(
                  translateDatabase(productModel.productDescriptionAr!,
                      productModel.productDescription!),
                  style: const TextStyle(fontSize: 15, height: 1.5),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               productModel.productDiscount!.toInt() >0?
               RichText(
                 text: TextSpan(
                  children: [
                    TextSpan(
                        text: productModel.productPriceDiscount,
                        //"${(productModel.productPrice! -(productModel.productPrice!*productModel.productDiscount!/100)).toInt()}",
                        style: const TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    const TextSpan(
                        text: "  ",
                      ),
                    TextSpan(
                    text: productModel.productPrice!.toString(),
                    style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    height: 1.5,
                    fontSize: 15,
                    color: AppColors.lightGery,
                  ),
                    ),
                  ],
                 ),
               )
               :Text(
                    productModel.productPriceDiscount!.toString(),
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: AppColors.primaryColor,
                    ),
                  ),
               if(addFavorite) GetBuilder<FavoriteController>(
                   builder: (controller) {
                    return InkWell(
                      onTap: () {
                        if(controller.isFavorite[productModel.productId]=="1") {
                          controller.setFavorite(productModel.productId, "0");
                          controller.removeFavorite(productModel.productId);
                        } else {
                          controller.setFavorite(productModel.productId, "1");
                          controller.addFavorite(productModel.productId);
                        }

                      },
                      child: SvgPicture.asset(
                        controller.isFavorite[productModel.productId]=="1"?
                        AppImageAsset.favorite2
                        : AppImageAsset.favorite,
                        height: 20,
                        color: AppColors.red,
                      ),
                    );
                  },),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
