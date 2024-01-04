
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class CartData
{
  CRUD crud;
  CartData(this.crud);

  addCart(String id,String userId)async
  {
    var response = await crud.postData( AppLink.addCart , {"id":id , "userid":userId});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String id,String userId)async
  {
    var response = await crud.postData( AppLink.removeCart , {"id":id , "userid":userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteAllCountCart(String id,String userId)async
  {
    var response = await crud.postData( AppLink.deleteAllCount , {"id":id , "userid":userId});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String id,String userId)async
  {
    var response = await crud.postData( AppLink.getCount , {"id":id , "userid":userId});
    return response.fold((l) => l, (r) => r);
  }

  getAllFromCart(String userId)async
  {
    var response = await crud.postData( AppLink.cartView , { "userid":userId });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName)async
  {
  var response = await crud.postData( AppLink.coupon , { "coupon_name": couponName });
  return response.fold((l) => l, (r) => r);
  }

  // deleteFavorite(String id)async
  // {
  //   var response = await crud.postData( AppLink.deleteFavorite , { "id": id });
  //   return response.fold((l) => l, (r) => r);
  // }

}