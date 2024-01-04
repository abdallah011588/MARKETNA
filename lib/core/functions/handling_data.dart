

import 'package:e_commerce_app/core/class/request_status.dart';

handlingData(response) {
  if(response is RequestStatus)
    {
      return response;
    }
  else{
    return RequestStatus.success;
  }
}