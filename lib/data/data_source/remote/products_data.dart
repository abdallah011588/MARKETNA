
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class ProductsData
{
  CRUD crud;
  ProductsData(this.crud);

  getData(String id,String userId)async
  {
    var response = await crud.postData( AppLink.products , {"id":id , "userid":userId});
    return response.fold((l) => l, (r) => r);
  }
}