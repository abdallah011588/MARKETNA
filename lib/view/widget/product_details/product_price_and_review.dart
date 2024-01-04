
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product_priceAndReview extends StatelessWidget {
  final String name;
  const Product_priceAndReview({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(name,
          style: Theme
              .of(context)
              .textTheme
              .headline1,
        ),
        const Spacer(),
        SizedBox(
          width: 70,
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SvgPicture.asset(AppImageAsset.star,);
            },
          ),
        ),
      ],
    );
  }
}
