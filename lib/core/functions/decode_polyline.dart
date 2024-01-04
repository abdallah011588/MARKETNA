import 'dart:convert';

import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;


Future getPolyLine(lat , long , desLat , desLong)async
{
  Set<Polyline> polyLineSet={};
  List<LatLng> polyLineCoordinates=[];
  PolylinePoints polylinePoints = PolylinePoints();

  var url="https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$desLat,$desLong&key=AIzaSyDQDpxSNGbJdyKqEhBgpEfxCJgjjYjVYkA";
  var response =await http.post(Uri.parse(url));
  var responseBody=jsonDecode(response.body);
  var point = responseBody['routes'][0]["overview_polyline"]['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if(result.isNotEmpty)
    {
      result.forEach((PointLatLng element) {
        polyLineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
    }
  Polyline polyline = Polyline(polylineId: PolylineId("1"),points: polyLineCoordinates ,color: AppColors.blue,width: 5,);
  polyLineSet.add(polyline);
  return polyLineSet;

}