
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class NotificationData
{
  CRUD crud;
  NotificationData(this.crud);

  getData(String userId)async
  {
    var response = await crud.postData( AppLink.notification , {"user_id" : userId,});
    return response.fold((l) => l, (r) => r);
  }
}