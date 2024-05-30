import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/constant/colors.dart';

class AddAdressMapController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  List<Marker> marker = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    marker.clear();
    marker.add(Marker(markerId: MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  CameraPosition? kGooglePlex;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 20,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }

  goToAddressDetailsPage() {
    if (marker.isEmpty) {
      Get.snackbar(
        "تنبية",
        "يجب تحديد الموقع على الخريطة اولا",
        backgroundColor: AppColor.fithColor,
        colorText: AppColor.primaryColor,
      );
    } else {
      Get.toNamed(AppRoute.addressAdd, arguments: {
        "lat": lat.toString(),
        "long": long.toString(),
      });
    }
  }
}
