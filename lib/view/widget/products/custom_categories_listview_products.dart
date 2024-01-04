import 'package:e_commerce_app/controller/products_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoriesProductsListView extends GetView<ProductsControllerImp>  {
  const CustomCategoriesProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemBuilder: (context, index) => CategoriesProductsBuilder(
          categoryModel: CategoryModel.fromJson(controller.categories[index]),
          index: index,
        ),
        itemCount: controller.categories.length,
      ),
    );
  }
}

class CategoriesProductsBuilder extends GetView<ProductsControllerImp> {
  final CategoryModel categoryModel;
  final int? index;

  const CategoriesProductsBuilder({
    Key? key,
    required this.categoryModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsControllerImp());
    return GetBuilder<ProductsControllerImp>(builder: (controller) => InkWell(
      onTap: () {
        controller.changeCategory(index!,categoryModel.categoryId.toString());
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10,left: 10,bottom: 5),
        decoration:index==controller.selectedCategories? const BoxDecoration(
          border:  Border(
            bottom: BorderSide(color: AppColors.primaryColor,width: 3),
          ),
        ):null,
        child: Text(
          translateDatabase(categoryModel.categoryNameAr!, categoryModel.categoryName!),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    ),);
  }
}
