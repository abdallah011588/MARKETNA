import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/offers_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/view/screen/search_screen.dart';
import 'package:e_commerce_app/view/widget/custom_offers_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController offersController=  Get.put(OffersController());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("Offers".tr,
          style:const TextStyle(
            color: AppColors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
          onTap: (){
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 8.0,),
              decoration:const  BoxDecoration(
                shape: BoxShape.circle,
                color:  AppColors.lightGery3,
              ),
              child: IconButton(
                onPressed: (){
                  showSearch(context: context, delegate: searchDelegate(list:offersController.offers ));
                },
                icon: SvgPicture.asset(AppImageAsset.search,height: 20,),
                iconSize: 30,
                splashRadius: 25,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<OffersController>(builder: (controller){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: HandlingDataView(
            requestStatus: controller.requestStatus,
            widget: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll){
                overScroll.disallowIndicator();
                return true;
              },
              child: RefreshIndicator(
                  child: GridView.builder(
                    // shrinkWrap: true,
                    // physics: const BouncingScrollPhysics(),
                      itemCount: controller.offers.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.62,
                      ),
                      itemBuilder:(context , index){
                        //favoriteController.isFavorite[controller.products[index]["product_id"]]
                        // =controller.products[index]["favorite"];
                        favoriteController.setFavorite(
                          controller.offers[index].productId,
                          controller.offers[index].favorite.toString(),
                        );
                        return CustomOfferProductGridView(productModel: controller.offers[index],addFavorite: true,);
                      }),
                  onRefresh:(){
                    return controller.getOffersData();
                  } ),
            ),
          ),
        );
      }
      ),
    );
  }
}
