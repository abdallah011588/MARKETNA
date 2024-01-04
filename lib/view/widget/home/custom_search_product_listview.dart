import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchProductListView extends GetView<HomeControllerImp> {
  final bool favorite;
  final ProductModel productModel;

  const CustomSearchProductListView({Key? key, required this.productModel,required this.favorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotToProductDetails(productModel);
      },
      child: Card(

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Hero(
                  tag: "${productModel.productId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        AppLink.productImage + "/" + productModel.productImage!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      translateDatabase(
                          productModel.productNameAr!, productModel.productName!),
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.black),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    Text(
                      translateDatabase(productModel.productDescriptionAr!, productModel.productDescription!),
                      style: const TextStyle(fontSize: 15, height: 1.5,color: AppColors.lightGery),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),

                    // const SizedBox(
                    //   height: 5,
                    // ),
                    //
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       productModel.productPrice!.toString(),
                    //       style: const TextStyle(
                    //         height: 1.5,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 17,
                    //         color: AppColors.primaryColor,
                    //       ),
                    //     ),
                    //     GetBuilder<FavoriteController>(
                    //       builder: (controller) {
                    //       return InkWell(
                    //         onTap: () {
                    //           if(controller.isFavorite[productModel.productId]=="1") {
                    //             controller.setFavorite(productModel.productId, "0");
                    //             controller.removeFavorite(productModel.productId);
                    //           } else {
                    //             controller.setFavorite(productModel.productId, "1");
                    //             controller.addFavorite(productModel.productId);
                    //           }
                    //
                    //         },
                    //         child: SvgPicture.asset(
                    //           controller.isFavorite[productModel.productId]=="1"?
                    //           AppImageAsset.favorite2
                    //               : AppImageAsset.favorite,
                    //           height: 20,
                    //           color: AppColors.red,
                    //         ),
                    //       );
                    //     },
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
