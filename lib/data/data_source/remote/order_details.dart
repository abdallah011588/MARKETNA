
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class OrderDetailsData
{
  CRUD crud;
  OrderDetailsData(this.crud);

  getData(String orderId)async
  {
    var response = await crud.postData( AppLink.ordersDetails , {
      "order_id":orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}