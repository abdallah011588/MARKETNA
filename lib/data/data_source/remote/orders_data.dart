
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class OrdersData
{
  CRUD crud;
  OrdersData(this.crud);

  getPendingData(String userId)async
  {
    var response = await crud.postData( AppLink.pending , {"user_id":userId,});
    return response.fold((l) => l, (r) => r);
  }

  getArchivedData(String userId)async
  {
    var response = await crud.postData( AppLink.archived , {"user_id":userId,});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderId)async
  {
    var response = await crud.postData( AppLink.deleteOrder , {"order_id":orderId,});
    return response.fold((l) => l, (r) => r);
  }

  ratingData(String userId ,String orderId ,double rating ,String feedback)async
  {
    var response = await crud.postData( AppLink.rating , {
      "user_id":userId,
      "order_id":orderId,
      "order_rating":rating.toString(),
      "order_rating_feedback":feedback,
    });
    return response.fold((l) => l, (r) => r);
  }
}