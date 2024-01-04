
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class AddressData
{
  CRUD crud;
  AddressData(this.crud);

  addData(String userId ,String name,String city,String street,String lat,String long) async
  {
    var response = await crud.postData( AppLink.addAddress , {
      "user_id":userId,
      "address_name": name,
      "city": city,
      "street": street,
      "latitude": lat,
      "longitude": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(String userId)async
  {
    var response = await crud.postData( AppLink.addressView , {
      "user_id":userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressId)async
  {
    var response = await crud.postData( AppLink.deleteAddress , {
      "address_id":addressId,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String addressId ,String name,String city,String street,String lat,String long)async
  {
    var response = await crud.postData( AppLink.addressEdit , {
      "address_id":addressId,
      "address_name": name,
      "city": city,
      "street": street,
      "latitude": lat,
      "longitude": long,
    });
    return response.fold((l) => l, (r) => r);
  }

}