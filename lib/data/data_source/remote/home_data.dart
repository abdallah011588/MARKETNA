
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class HomeData
{
  CRUD crud;
  HomeData(this.crud);

  getData()async
  {
    var response = await crud.postData( AppLink.homePage , {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String productName)async
  {
    var response=await crud.postData(AppLink.search, {"product_name":productName});
    return response.fold((l) => l, (r) => r);
  }

}