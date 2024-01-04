
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/class/request_status.dart';
import 'package:e_commerce_app/core/functions/decode_polyline.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/model/order_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController
{

  RequestStatus requestStatus =RequestStatus.none;
  OrderModel? orderModel;
  MyServices myServices=Get.find();

  // Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  GoogleMapController? mapController ;
  CameraPosition? cameraPosition ;
  Set<Marker> markers={};

  Set<Polyline> polyLineSet={};
  double ? lat;
  double ? long;
  Timer? timer;


  initialData()
  {
    requestStatus=RequestStatus.loading;
    if(orderModel!.orderType =="0") {
      cameraPosition = CameraPosition(
        target: LatLng(
            double.parse(orderModel!.addressLat!),
            double.parse(orderModel!.addressLong!),
        ),
        zoom: 8,
      );
      markers.add(
        Marker(
          markerId:const MarkerId("1"),
          position: LatLng(
              double.parse(orderModel!.addressLat!),
              double.parse(orderModel!.addressLong!),
          ),
        ),
      );
      requestStatus=RequestStatus.success;
    }
    update();
  }


  getCurrentLocation()
  {
    //
    // markers.removeWhere((element) => element.markerId.value=="current");
    // markers.add( Marker(
    //   markerId:const MarkerId("current"),
    //   position: LatLng(event.latitude , event.longitude,),
    // ),);
  }


  initPolyLine()async
  {
    polyLineSet= await getPolyLine(
    lat,
    long,
    double.parse(orderModel!.addressLat!),
    double.parse(orderModel!.addressLong!),
    );

    update();
  }


  getDeliveryLocation()async
  {
    FirebaseFirestore.instance.collection("delivery").doc(orderModel!.orderId).snapshots().listen((event) {
     if(event.exists)
      {
        lat=double.parse(event.data()!['lat'].toString());
        long=double.parse(event.data()!['long'].toString());

        markers.removeWhere((element) => element.markerId.value=="current");
        markers.add( Marker(
          markerId:const MarkerId("current"),
          position: LatLng(lat! , long!),
        ),);
        update();
      }
    });
  }



  @override
  void onInit() {
    if(Get.arguments['orderModel'] !=null) {
      orderModel = Get.arguments['orderModel'];
      initialData();
    }
    getDeliveryLocation();
    //initPolyLine();
    super.onInit();
  }



  @override
  void onClose() {
    // timer!.cancel();
    mapController!.dispose();
    super.onClose();
  }

}