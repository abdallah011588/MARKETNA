
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class FavoriteData
{
  CRUD crud;
  FavoriteData(this.crud);

  addFavorite(String id,String userId)async
  {
    var response = await crud.postData( AppLink.addFavorite , {"id":id , "userid":userId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String id,String userId)async
  {
    var response = await crud.postData( AppLink.removeFavorite , {"id":id , "userid":userId});
    return response.fold((l) => l, (r) => r);
  }


  getAllFavorite(String userId)async
  {
    var response = await crud.postData( AppLink.favoriteView , { "userid":userId });
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String id)async
  {
    var response = await crud.postData( AppLink.deleteFavorite , { "id": id });
    return response.fold((l) => l, (r) => r);
  }

}