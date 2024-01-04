
import 'package:e_commerce_app/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings
{
  @override
  void dependencies() {
   Get.put(CRUD());
  }


}