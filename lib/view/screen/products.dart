
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/products_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/view/screen/search_screen.dart';
import 'package:e_commerce_app/view/widget/custom_appbar.dart';
import 'package:e_commerce_app/view/widget/products/custom_categories_listview_products.dart';
import 'package:e_commerce_app/view/widget/products/custom_product_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     Get.put(ProductsControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GetBuilder<ProductsControllerImp>(
       builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(top: 10.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll){
            overScroll.disallowIndicator();
            return true;
          },
          child:  ListView(
            children: [
              CustomAppBar(
                hintText: "Search product".tr,
                searchController:  controller.searchController!,
                onPressedCart: (){
                  Get.toNamed(AppRoutes.cartScreen);
                },
                onPressedNotify: (){
                  Get.toNamed(AppRoutes.notifications);
                },
                onPressedSearch: (){
                  // controller.onSearch();
                  showSearch(
                    context: context,
                    delegate: searchDelegate(list: controller.products),
                  );
                },
                onChanged: (text){
                  controller.checkSearch(text);
                },
              ),
              Column(
                children: [
                  const SizedBox(height: 10,),
                  const CustomCategoriesProductsListView(),
                  const SizedBox(height: 10,),
                  HandlingDataView(
                    requestStatus: controller.requestStatus,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.62,
                        ),
                        itemBuilder:(context , index){
                          //favoriteController.isFavorite[controller.products[index]["product_id"]]
                          // =controller.products[index]["favorite"];
                          favoriteController.setFavorite(
                            controller.products[index].productId,//["product_id"].toString(),
                            controller.products[index].favorite,//["favorite"].toString(),
                          );
                          return CustomProductGridView(productModel:controller.products[index]);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}


/*

controller.isSearch?
              HandlingDataView(
                requestStatus: controller.requestStatus,
                widget: ListView.separated(
                    separatorBuilder: (context, index) =>const SizedBox(height: 10,),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.searchProducts.length,
                    itemBuilder:(context , index){
                      favoriteController.setFavorite(
                        controller.searchProducts[index].productId,//["product_id"],
                        controller.searchProducts[index].favorite,//["favorite"].toString(),
                      );

                      return CustomSearchProductListView(
                        productModel:controller.searchProducts[index],
                        favorite: true,
                      );
                    }),
              )
                  :
 */