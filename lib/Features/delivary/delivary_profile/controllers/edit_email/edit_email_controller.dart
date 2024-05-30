import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';
import '../../data/datasorce/remote/profile_data.dart';

abstract class EditEmailController extends GetxController {
  sendVerificationCode();
}

class DelivaryEditEmailControllerImp extends EditEmailController {
  StatusRequest statusRequest = StatusRequest.none;
  DelivaryProfileData profileData = DelivaryProfileData(Get.find());
  MyServices myServices = Get.find();
  late GlobalKey<FormState> key;
  late TextEditingController newEmail;

  @override
  sendVerificationCode() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await profileData.delivaryEditEmail(
        userEmail: myServices.sharedPreferences.getString("email")!,
        newEmail: newEmail.text.trim(),
      );
      debugPrint('==================== Edit Email Controller $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoute.delivaryProfileEditEmailVerifyCode, arguments: {
            "userEmail": myServices.sharedPreferences.getString("email")!,
            "newEmail": newEmail.text.trim(),
          });
          Get.snackbar(
            "تنبية",
            "تم ارسال كود التحقق الى بريدك الاكترونى",
            backgroundColor: AppColor.fithColor,
            colorText: AppColor.primaryColor,
          );
        } else if (response['message'] == "Email already exists") {
          Get.defaultDialog(
              title: "تنبية", middleText: "البريد الالكترونى موجود بالفعل");
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    key = GlobalKey();
    newEmail = TextEditingController();
    super.onInit();
  }
}
