import 'dart:io';

import 'package:express_corner/Features/auth/data/frist_login_data.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/get_current_location.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/location_services.dart';
import '../../../../core/services/services.dart';

abstract class LocationAccessController extends GetxController {
  goToHome();
  updateType();
  // requestPerLocation();
  intialData();
}

class LocationAccessControllerImp extends LocationAccessController {
  String? email;
  String? userType;
  String? typeVichele;
  String? expertise;
  File? imageVichele;
  File? imageDelivaryId;
  File? imageDrivingLicense;

  StatusRequest statusRequest = StatusRequest.none;
  FirstLoginData firstLoginData = FirstLoginData(Get.find());
  MyServices myServices = Get.find();

  @override
  goToHome() async {
    await updateType();
    if (userType == "1") {
      Get.offAllNamed(AppRoute.homeLayoutView);
    } else if (userType == "2") {
      Get.offAllNamed(AppRoute.delivaryHomeLayoutView);
    }
  }

  // @override
  // requestPerLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();

  //   if (!serviceEnabled) {
  //     return Get.snackbar("تنبيه", "الرجاء تشخيل خدمه تحديد الموقع");
  //   } else {
  // if (userType == "1") {
  //   Get.offAllNamed(AppRoute.homeLayoutView);
  // } else if (userType == "2") {
  //   Get.offAllNamed(AppRoute.delivaryHomeLayoutView);
  // }
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Get.snackbar(
  //           "تنبيه", "الرجاء اعطاء صلاحيه  تحديد الموقع للتطبيق");
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق بدون اللوكيشن");
  //   }
  // }

  LocationServices locationServices = LocationServices();

  @override
  updateType() async {
    var x = await locationServices.firstLoginCheckAndRequestLocationService();
    var y =
        await locationServices.firstLoginCheckAndRequestLocationPermission();
    if (x == true && y == true) {
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (userType == "1") {
        response = await firstLoginData.userUpdateType(
          email: myServices.sharedPreferences.getString("email")!,
          userType: userType!,
        );
      } else if (userType == "2") {
        response = await firstLoginData.delivaryUpdateType(
          email: email.toString(),
          userType: userType!,
          typeVichele: typeVichele.toString(),
          expertise: expertise.toString(),
          imageVichele: imageVichele!,
          imageDelivaryId: imageDelivaryId!,
          imageDrivingLicense: imageDrivingLicense!,
        );
      }

      debugPrint(
          '==================== First Login Cotroller  : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // requestPerLocation();
          if (userType == "1") {
            myServices.sharedPreferences.setString("step", "3");
            Get.offAllNamed(AppRoute.homeLayoutView);
          } else if (userType == "2") {
            myServices.sharedPreferences.setString("step", "4");
            Get.offAllNamed(AppRoute.delivaryHomeLayoutView);
          }
        } else {
          Get.defaultDialog(title: "تنبية", middleText: "حاول مره اخرى");
          statusRequest = StatusRequest.failure;
        }
      }
    }

    update();
  }

  @override
  intialData() {
    if (userType == "2") {
      typeVichele = Get.arguments["typeVichele"];
      expertise = Get.arguments["expertise"];
      imageVichele = Get.arguments["imageVichele"];
      imageDelivaryId = Get.arguments["imageDelivaryId"];
      imageDrivingLicense = Get.arguments["imageDrivingLicense"];
    } else if (userType == "1") {
      typeVichele = "";
      expertise = "";
      imageVichele = null;
      imageDelivaryId = null;
      imageDrivingLicense = null;
    }
  }

  @override
  void onInit() {
    userType = Get.arguments["userType"];
    email = myServices.sharedPreferences.getString("email");
    intialData();
    print(userType);

    super.onInit();
  }
}
