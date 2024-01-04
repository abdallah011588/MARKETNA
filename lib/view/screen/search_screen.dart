
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:e_commerce_app/view/widget/cart/appbar.dart';
import 'package:e_commerce_app/view/widget/home/custom_search_product_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {

  var controller=TextEditingController();

  ProductModel? model;
  @override
  Widget build(BuildContext context) {
    Get.put(SearchMixController());
    //controller.dispose();
    return GetBuilder<SearchMixController>(
      builder: (searchController) {
        return Scaffold(
          appBar:customAppBar("Search".tr),
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: searchController.searchController,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'can not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Search'.tr,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 8.0,bottom:  8.0,end:  8.0),
                      child: Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          onPressed: ()
                          {
                            searchController.searchData();
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
                if(searchController.searchProducts.length>0)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:(context, index) =>CustomSearchProductListView(
                      productModel:searchController.searchProducts[index],
                      favorite: false,
                    ),
                    separatorBuilder:(context, index) =>const SizedBox(height: 10,) ,
                    itemCount: searchController.searchProducts.length,
                  ),
              ],
            ),
          ),
        );
      }
    );
  }
}






/// //////////////////////////////

class searchDelegate extends  SearchDelegate<String>
{

  final List<ProductModel> list;
  searchDelegate({required this.list,});


  @override
  String? get searchFieldLabel => "Search".tr;

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
        onPressed: (){
          query='';
        },
        icon:const Icon(Icons.clear,color: Colors.black,),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, 'Close');
      },
      icon:const Icon(Icons.arrow_back,color: Colors.black,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var resultList = query.isEmpty? []
    :list.where((element) {
      return element.productName!.toLowerCase().contains(query.toLowerCase()) || element.productNameAr!.contains(query);
    }
    ).toList();
    return resultList.isNotEmpty? Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CustomSearchProductListView(
            productModel:resultList[index],
            favorite: false,
          );
        },
        separatorBuilder:(context, index)=> const SizedBox(height: 10,),
        itemCount: resultList.length,
      ),
    )
    :const Center(child: Text("No Products",style: TextStyle(color: AppColors.lightGery,fontSize: 18),),);

    }

  @override
  Widget buildSuggestions(BuildContext context) {

    var searchList= query.isEmpty? []
        :list.where((element) {
          return element.productName!.toLowerCase().contains(query.toLowerCase())|| element.productNameAr!.contains(query);
        }).toList();
    return  searchList.isNotEmpty? Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.separated(
        itemBuilder: (context, index)=> CustomSearchProductListView(
          productModel:searchList[index],
          favorite: false,
        ),
        separatorBuilder:(context, index)=> const SizedBox(height: 10,),
        itemCount: searchList.length,

      ),
    )
        :Center(child: Text("No Products".tr,style: const TextStyle(color: AppColors.lightGery,fontSize: 18),),);
  }


  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color:Colors.black,
        ),
        border: UnderlineInputBorder(),
      ),
      textTheme: const TextTheme(
          subtitle1: TextStyle(
            color:Colors.black,
            fontSize: 17,
          )
      ),
    );
  }

}





