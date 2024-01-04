
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class CheckoutData
{
  CRUD crud;
  CheckoutData(this.crud);

  checkout(Map data)async
  {
    var response = await crud.postData( AppLink.checkout , data);
    return response.fold((l) => l, (r) => r);
  }
}