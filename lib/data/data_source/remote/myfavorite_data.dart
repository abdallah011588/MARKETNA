
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class MyFavoriteData
{
  CRUD crud;
  MyFavoriteData(this.crud);

  getAllFavorite(String userId)async
  {
    var response = await crud.postData( AppLink.favoriteView , { "userid":userId });
    return response.fold((l) => l, (r) => r);
  }

  getData(String categoryId, String  userId,String productId)async
  {
    var response = await crud.postData( AppLink.viewFavoriteProduct , {
      "id": categoryId,
      "userid": userId,
      "productid": productId,
    });
    return response.fold((l) => l, (r) => r);
  }


  deleteFavorite(String id)async
  {
    var response = await crud.postData( AppLink.deleteFavorite , { "id": id });
    return response.fold((l) => l, (r) => r);
  }

}