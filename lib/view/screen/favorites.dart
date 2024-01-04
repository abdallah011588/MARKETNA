import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/myfavorite_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Center(
      child: GetBuilder<MyFavoriteController>(
        builder: (controller) {
          // controller.getAllFavorite();
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.62),
              itemBuilder: (context , index){
                return InkWell(
                  onTap: () {
                    controller.gotToProductDetails(
                        controller.allFavorite[index].productCategory.toString() ,
                        controller.allFavorite[index].productId.toString(),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: "${controller.allFavorite[index].productId}",
                            child: CachedNetworkImage(
                              imageUrl:
                              AppLink.productImage + "/" + controller.allFavorite[index].productImage!,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            translateDatabase(
                                controller.allFavorite[index].productNameAr!,  controller.allFavorite[index].productName!),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: AppColors.black),
                          ),
                          Expanded(
                            child: Text(
                              translateDatabase(controller.allFavorite[index].productDescriptionAr!,
                                  controller.allFavorite[index].productDescription!),
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
                              Text(
                                controller.allFavorite[index].productPrice!.toString(),
                                style: const TextStyle(
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.deleteFavorite(controller.allFavorite[index].favoriteId.toString());
                                },
                                child: SvgPicture.asset( AppImageAsset.delete,
                                  height: 20,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount:controller.allFavorite.length,
            ),
          );
        },
      ),
    );
  }
}
