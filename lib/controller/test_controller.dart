

import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/data_source/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController
{
  TestData testData = TestData(Get.find());
  List data = [];
  late RequestStatus requestStatus ;

  getData()async{

    requestStatus = RequestStatus.loading;
    var response  = await testData.getData();
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
      {
        if(response['status']=="success")
          {
            data.addAll(response['data']);
          }
        else
          {
            requestStatus = RequestStatus.failure;
          }
      }
    update();

  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

}
