import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddress extends GetxController {
  getCurrentLocation();
}

class AddAddressImp extends AddAddress {
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(15.653120, 32.481529),
    zoom: 14.4746,
  );

  @override
  getCurrentLocation() {}
}
