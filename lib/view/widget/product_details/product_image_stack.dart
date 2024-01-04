import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class ProductImageStack extends GetView<ProductDetailsControllerImp> {
  const ProductImageStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        Hero(
          tag: "${controller.productModel.productId}",
          child: ClipRRect(
            // clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.only(
                bottomLeft: controller.myServices.shared!.getString("lang")=="en"?  const Radius.circular(70):const Radius.circular(0),
                bottomRight: controller.myServices.shared!.getString("lang")=="ar"?  const Radius.circular(70):const Radius.circular(0),
            ),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.productImage}/${controller.productModel.productImage!}",
              height: Get.height/2.5,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          right:controller.myServices.shared!.getString("lang")=="en"? 20:null,
          left:controller.myServices.shared!.getString("lang")=="ar"? 20:null,
          child: GetBuilder<FavoriteController>(builder: (favoriteController) {
            return FloatingActionButton(
              elevation: 3,
              onPressed: (){
                if(Get.previousRoute=="/ho;l,;l,;l,l;mePage") {}
                else
                  {
                    if(favoriteController.isFavorite[controller.productModel.productId]=="1") {
                      favoriteController.setFavorite(controller.productModel.productId, "0");
                      favoriteController.removeFavorite(controller.productModel.productId);
                    }
                    else {
                      favoriteController.setFavorite(controller.productModel.productId, "1");
                      favoriteController.addFavorite(controller.productModel.productId);
                    }
                  }
              },
              child: SvgPicture.asset(
                Get.previousRoute=="/homxcxcxcxcePage"?  AppImageAsset.favorite2:
                favoriteController.isFavorite[controller.productModel.productId]=="1"?
                AppImageAsset.favorite2
                    : AppImageAsset.favorite,
                height: 20,
                color: AppColors.red,
              ),
              backgroundColor: AppColors.white,
              mini: true,
            );
          },),
        )
      ],
    );
  }
}
