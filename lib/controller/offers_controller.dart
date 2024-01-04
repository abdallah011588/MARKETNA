
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/data_source/remote/offers_data.dart';
import 'package:e_commerce_app/data/model/product_model.dart';
import 'package:get/get.dart';

class OffersController extends GetxController
{
  late RequestStatus requestStatus;
  List<ProductModel> offers=[];
  OffersData offersData =Get.put(OffersData(Get.find()));
  MyServices myServices = Get.find();

  Future<void> getOffersData()async
  {
    requestStatus=RequestStatus.loading;
    update();
    var response=await offersData.getData(myServices.shared!.getString("id")!);
    requestStatus=handlingData(response);

    if(requestStatus==RequestStatus.success)
      {
        if(response['status']=="success")
          {
            offers=[];
            List dataList=response['data'];
            print("**************${response['data']}");
            offers.addAll(dataList.map((e) => ProductModel.fromJson(e)));
            requestStatus=RequestStatus.success;
            offers.forEach((element) {
              print(element.productPriceDiscount);
            });
          }
        else
          {
            requestStatus=RequestStatus.failure;
          }
      }
    update();
  }

  FavoriteController favoriteController =Get.put(FavoriteController());

  @override
  void onInit() {
    favoriteController.refresh();
    getOffersData();
    super.onInit();
  }

}

