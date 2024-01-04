
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class OffersData{
  CRUD crud;
  OffersData(this.crud);

  getData(String userId)async{
    var response =await crud.postData(AppLink.offers, {"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }
}