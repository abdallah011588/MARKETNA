
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class TestData
{
  CRUD crud;
  TestData(this.crud);

  getData()async
  {
    var response = await crud.postData( AppLink.test , {});
    return response.fold((l) => l, (r) => r);
  }
}