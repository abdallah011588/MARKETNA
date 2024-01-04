import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/view/screen/orders/archived.dart';
import 'package:e_commerce_app/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text("Orders".tr,style: const TextStyle(color: AppColors.black,fontSize: 25,),),
          centerTitle: true,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
            onTap: (){
              Get.back();
            },
          ),
          bottom: TabBar(
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.black,
              tabs: [
                // Tab(icon: Icon(Icons.view_list),),
                Tab(text: "Under review".tr,),
                Tab(text: "Done".tr,),
              ],
          ),
        ),
        body: const TabBarView(
          children: [
          Pending(),
          Archived(),
          // Center(child:Text("Orders")),
          // Center(child:Text("Orders done")),
        ]),
      ),
    );
  }
}
