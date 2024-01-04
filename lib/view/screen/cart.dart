import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Your Cart".tr,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
      ),
      // backgroundColor: AppColors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(AppImageAsset.onBoardingImage1)),
                    const Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(
                          "Hp Laptop 5454",
                        ),
                        subtitle: Text("2500\$"),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                        const Text("2"),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.remove)),
                      ],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(AppImageAsset.onBoardingImage1)),
                    const Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text(
                            "Hp Laptop 5454",
                          ),
                        )),
                    Expanded(
                        child: Column(
                      children: [],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(AppImageAsset.onBoardingImage1)),
                    const Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text(
                            "Hp Laptop 5454",
                          ),
                        )),
                    Expanded(
                        child: Column(
                      children: [],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(AppImageAsset.onBoardingImage1)),
                    const Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text(
                            "Hp Laptop 5454",
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
