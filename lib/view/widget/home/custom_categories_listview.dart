import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/data/model/category_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomCategoriesListView extends StatelessWidget {
  const CustomCategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => SizedBox(
        height: 110,
        child: controller.products.length > 0
            ? ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 23,
                ),
                itemBuilder: (context, index) => CategoriesBuilder(
                  categoryModel: CategoryModel.fromJson(controller.categories[index]),
                  index: index,
                ),
                itemCount: controller.categories.length,
              )
            : const Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              )),
      ),
    );
  }
}

class CategoriesBuilder extends GetView<HomeControllerImp> {
  final CategoryModel categoryModel;
  final int? index;

  const CategoriesBuilder({
    Key? key,
    required this.categoryModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProducts(
            controller.categories,
             index!,
            categoryModel.categoryId.toString(),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primaryColor3,
            ),
            padding: const EdgeInsets.all(15),
            child: SvgPicture.network(
              "${AppLink.categoryImage}/${categoryModel.categoryImage}",
              color: AppColors.primaryColor4,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            translateDatabase(categoryModel.categoryNameAr!, categoryModel.categoryName!),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
