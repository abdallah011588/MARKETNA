
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:e_commerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductsListView extends StatelessWidget{
  const CustomProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) =>  SizedBox(
      height: 140,
      child:controller.products.length >0?
      ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>const SizedBox(width: 20,),
        itemBuilder:(context, index) =>InkWell(
          onTap: (){
            controller.gotToProductDetails(ProductModel.fromJson(controller.products[index]));
          },
          child: ProductsBuilder(
              productModel:ProductModel.fromJson(controller.products[index]),
            image: controller.products[index]['product_image'],
            name:controller.products[index]['product_name'],
            model: controller.products[index],
          ),
        ),
        itemCount:controller.products.length ,
      )
          :const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),

    ),);
  }
}

class ProductsBuilder extends StatelessWidget {
  final ProductModel productModel;
  final String image;
  final String name;
  final Map<String,dynamic> model;
  const ProductsBuilder({Key? key,required this.productModel,required this.image,required this.name,required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Image.network(
            // "${AppLink.productImage}/${productModel.productImage}",
            "${AppLink.productImage}/${image}",
            width: 200,
            height: 120,
            fit: BoxFit.fill,
          ),
          borderRadius:BorderRadius.circular(20) ,
        ),
        const SizedBox(height: 5,),
        Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.black.withOpacity(0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0,),
            child: Text(
             //translateDatabase( productModel.categoryNameAr!,  productModel.categoryName!),
              name,
              style:const TextStyle(
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
