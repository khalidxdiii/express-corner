import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';

abstract class ChooseUserTypeController extends GetxController {
  goToLocationAccess();
  goToHome();
  changeType(String val);
  requestPerLocation();
}

class ChooseUserTypeControllerImp extends ChooseUserTypeController {
  String? userType;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  changeType(String val) {
    // 2 => delivary
    // 1 => user

    userType = val;
    update();
  }

  @override
  goToLocationAccess() {
    if (userType != "2" && userType != "1") {
      Get.snackbar("تنبيه", "برجاء اختيار نوع حسابك",
          backgroundColor: Colors.white);
    } else {
      if (userType == "2") {
        Get.toNamed(AppRoute.workAsDelivary, arguments: {"userType": userType});
      } else {
        Get.toNamed(AppRoute.locationAccess, arguments: {"userType": userType});
      }
    }
  }

  @override
  goToHome() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشخيل خدمه تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "تنبيه", "الرجاء اعطاء صلاحيه  تحديد الموقع للتطبيق");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق بدون اللوكيشن");
    }
  }
}
