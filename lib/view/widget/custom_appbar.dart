
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomAppBar extends StatelessWidget {
  final String hintText;
  final void Function()? onPressedCart;
  final void Function()? onPressedNotify;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController searchController;
  const CustomAppBar({Key? key,
    required this.hintText,
    required this.onPressedCart,
    required this.onPressedNotify,
    required this.onPressedSearch,
    required this.onChanged,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: InkWell(
        //     onTap: onPressedSearch,
        //     child: Container(
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         color: AppColors.lightGery2,
        //       ),
        //       height: 60,
        //       child: Row(
        //         mainAxisSize: MainAxisSize.min,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           const Icon(Icons.search_outlined, color:AppColors.grey,),
        //
        //           Text(hintText),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: AppColors.grey,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor:AppColors.lightGery3,
            ),
            onPressed: onPressedSearch,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppImageAsset.search,
                  color: AppColors.grey,
                  width: 20,
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(hintText,style: const TextStyle(fontSize: 15),)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5,),
        Container(
          height: 55,
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightGery3,
          ),
          child: TextButton(
            onPressed:onPressedCart,
            child: SvgPicture.asset(AppImageAsset.cart,),
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor:AppColors.lightGery3,
              primary: AppColors.grey,
              padding: const EdgeInsets.all(1),
            ),

          ),
        ),
        Container(
          height: 55,
          decoration:const  BoxDecoration(
            shape: BoxShape.circle,
            color:  AppColors.lightGery3,
          ),
          child: TextButton(
            onPressed: onPressedNotify,
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor:AppColors.lightGery3,
              primary: AppColors.grey,
              padding: const EdgeInsets.all(1),
            ),
            child: SvgPicture.asset(AppImageAsset.notification),
          ),
          // child: IconButton(
          //   onPressed: onPressedNotify,
          //   icon: SvgPicture.asset(AppImageAsset.notification),
          //   iconSize: 35,
          //   splashRadius: 30,
          // ),

        ),
      ],
    );
  }
}
