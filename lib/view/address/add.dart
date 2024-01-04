



import 'package:e_commerce_app/controller/address_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String apiKey="AIzaSyDQDpxSNGbJdyKqEhBgpEfxCJgjjYjVYkA";

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return GetBuilder<AddressController>(
      builder:(addressController)=> Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text("Addresses".tr,style: const TextStyle(color: AppColors.black,fontSize: 22,),),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
            onTap: (){
              Get.back();
            },
          ),
          actions: [
            IconButton(
              onPressed:(){
                addressController.goToCurrentLocation();
                },
              icon:const Icon(Icons.my_location,color: AppColors.black,),
              splashRadius: 20,
            ),
          ],
        ),
        body:HandlingDataView(
            requestStatus: addressController.requestStatus,
            widget: addressController.currentCameraPosition !=null?
            GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:addressController.currentCameraPosition! ,//addressController.currentCameraPosition!,
            markers:addressController.markers.isNotEmpty?
            addressController.markers.toSet()
            :{
              Marker(markerId: const MarkerId("1"),position:LatLng(
                addressController.lat,
                addressController.long,),
              ),
            },

             onMapCreated: (GoogleMapController controller) {
                addressController.controller.complete(controller);
              },
              onTap: (latLng){
                addressController.addMarkers(latLng);
              },
          )
              :const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){addressController.goToAddressDetails();},
          label: Text('Continue'.tr),
          icon: const Icon(Icons.navigate_next),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}


/*
class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
      bearing: 192.8334901395799,
    );

  CameraPosition? currentCameraPosition ;


  Position? currentLocation;
  var lat;
  var long;

  Future getPosition()async
  {
    bool? service;
    LocationPermission locationPer;
    service = await Geolocator.isLocationServiceEnabled();

    if(!service)
      {
        Get.defaultDialog(
          title: "Services",
         content: Text("Service is not enabled") ,
        );
      }

    locationPer = await Geolocator.checkPermission();

    if(locationPer == LocationPermission.denied)
      {
        locationPer = await Geolocator.requestPermission();
      }
    if(locationPer == LocationPermission.always)
      {
        getLatAndLong();
      }
    print("************************");
    print(locationPer);
  }

  // Future<Position> getLatAndLong()async
  Future<void> getLatAndLong()async
  {
    currentLocation = await Geolocator.getCurrentPosition().then((value) => value);
    lat=currentLocation!.latitude;
    long=currentLocation!.longitude;
    currentCameraPosition = CameraPosition(
      target: LatLng(lat, long),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
      bearing: 192.8334901395799,
    );
    setState(() {

    });

  }


  @override
  void initState() {
    getPosition();
    getLatAndLong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Addresses",style: TextStyle(color: AppColors.black,fontSize: 22,),),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
          onTap: (){
            Get.back();
          },
        ),
      ),
      body:  GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          currentLocation==null ?
          Marker(markerId: MarkerId("2"),position:LatLng(180.0,14.0),)
          :Marker(markerId: MarkerId("1"),position:LatLng(currentLocation!.latitude,currentLocation!.longitude),),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToCurrentLocation,
        label: const Text('My current location!'),
        icon: const Icon(Icons.directions_boat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }




  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition!));
  }


}

*/

