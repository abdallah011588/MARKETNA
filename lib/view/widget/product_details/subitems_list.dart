import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(controller.subItems.length,
              (index) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 25,
              width: 25,
              decoration:controller.subItems[index]["active"]=="1"? BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor,width: 2),
              ):null,
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.subItems[index]["color"],
                ),
                height: 20,
                width: 20,
              ),
            ),
          ),
        ),

      ],
    );

  }
}
