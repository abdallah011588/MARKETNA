
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class CRUD{
  Future< Either<RequestStatus,Map> > postData(String linkUrl , Map data)async
  {
     try
       {
          if(await checkInternet())
          {
            var response =await http.post(Uri.parse(linkUrl) , body: data);
            if(response.statusCode==200 || response.statusCode==201)
            {
              Map responseBody = jsonDecode(response.body);
              return Right(responseBody);
            }
            else
            {
              return const Left( RequestStatus.server_failure);
            }
          }
          else
          {
            return const Left( RequestStatus.server_failure);
          }

       } catch(_) {
        return const Left( RequestStatus.server_exception);
      }
  }



}
