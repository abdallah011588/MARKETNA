


import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/link_api.dart';

class VerifyCodeForgetPasswordData
{
  CRUD crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData(String email,String verifyCode ,)async
  {
    var response = await crud.postData(
      AppLink.verifyCodeForgetPassword ,
      {
        "email":email,
        "verifycode":verifyCode,
      },
    );

    return response.fold((l) => l, (r) => r);
  }



  resendVerifyCode(String email)async
  {
    var response = await crud.postData(
      AppLink.checkEmail ,
      {
        "email":email,
      },
    );

    return response.fold((l) => l, (r) => r);
  }


}