import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/offers_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:e_commerce_app/view/screen/search_screen.dart';
import 'package:e_commerce_app/view/widget/custom_appbar.dart';
import 'package:e_commerce_app/view/widget/custom_offers_gridview.dart';
import 'package:e_commerce_app/view/widget/home/custom_categories_listview.dart';
import 'package:e_commerce_app/view/widget/home/custom_offer.dart';
import 'package:e_commerce_app/view/widget/home/custom_products_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());
    OffersController offersController = Get.put(OffersController());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
          overScroll.disallowIndicator();
          return true;
        },
        child: RefreshIndicator(child: ListView(
          children: [
            CustomAppBar(
              hintText: "Search product".tr,
              searchController: controller.searchController!,
              onPressedCart: (){
                 Get.toNamed(AppRoutes.cartScreen);
              },
              onPressedNotify: (){
                controller.gotToNotifications();
              },
              onPressedSearch: (){
                showSearch(
                  context: context,
                  delegate: searchDelegate(list: controller.products.map((e) => ProductModel.fromJson(e)).toList()),
                );
                // controller.onSearch();
              },
              onChanged: (text){
                controller.checkSearch(text);
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(controller.settings.isNotEmpty)  CustomOfferCard(title: controller.settingsTitle, subTitle: controller.settingsBody),
                const CustomCategoriesListView(),
                const SizedBox(height: 10,),
                Text(
                  "Top Selling".tr,
                  style: const TextStyle(
                    fontSize: 22,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 10,),
                const CustomProductsListView(),
                const SizedBox(height: 10,),

                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Special offers for you".tr,
                        style: const TextStyle(
                          fontSize: 22,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        Get.toNamed(AppRoutes.offers);
                      },
                      child: Row(
                        children: [
                          Text("See All".tr,style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                          ),),
                          const SizedBox(width: 5,),
                          const Icon(Icons.arrow_forward_ios,size: 18,),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                HandlingDataView(
                  requestStatus: offersController.requestStatus,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: offersController.offers.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.62,
                      ),
                      itemBuilder:(context , index){
                        //favoriteController.isFavorite[controller.products[index]["product_id"]]
                        // =controller.products[index]["favorite"];

                        favoriteController.setFavorite(
                          offersController.offers[index].productId,
                          offersController.offers[index].favorite.toString(),
                        );
                        return CustomOfferProductGridView(productModel: offersController.offers[index],addFavorite: false,);
                      }),
                ),
              ],
            ),
          ],
        ),
            onRefresh: (){
          return controller.getData();
        }),
      );
    },

    );
  }
}


/*

controller.isSearch?
            HandlingDataView(
              requestStatus: controller.requestStatus,
              widget: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10,),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.searchProducts.length,
                  itemBuilder:(context , index){
                    favoriteController.setFavorite(
                      controller.products[index]["product_id"],
                      controller.products[index]["favorite"].toString(),
                    );
                    return CustomSearchProductListView(
                      productModel: controller.searchProducts[index],
                      favorite: true,
                    );
                  }),
            )
            :
 */
