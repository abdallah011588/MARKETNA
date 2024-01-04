import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';


class CartCard extends StatelessWidget {
  const CartCard({Key? key,
    required this.productName,
    required this.productPrice,
    required this.productCount,
    required this.productImage,
    required this.onPressAdd,
    required this.onPressRemove,
  }) : super(key: key);

  final String productName;
  final String productPrice;
  final String productCount;
  final String productImage;
  final void Function()? onPressAdd;
  final void Function()? onPressRemove;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(imageUrl: productImage),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productPrice,
                    style: const TextStyle(
                      height: 2.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                ),
                const SizedBox(width: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(
                    splashRadius: 25,
                    onPressed: onPressRemove,
                    icon: const Icon(Icons.remove_circle_outline,color: AppColors.grey,size: 30,),
                  ),
                  const SizedBox(width: 5,),
                  Text(productCount),
                  const SizedBox(width: 5,),
                  IconButton(
                    splashRadius: 25,
                    onPressed: onPressAdd,
                    icon:const Icon(Icons.add_circle_outline,color: AppColors.grey,size: 30,),
                  ),
                ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
