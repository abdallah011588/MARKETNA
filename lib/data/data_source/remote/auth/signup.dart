


import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class SignupData
{
  CRUD crud;
  SignupData(this.crud);

  postData(String username,String email,String phone ,String password)async
  {
    var response = await crud.postData(
      AppLink.signup ,
      {
      "username":username,
      "email":email,
      "phone":phone,
      "password":password,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}