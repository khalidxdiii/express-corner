import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';
import '../../../../empthy status/presentation/views/status_success_view.dart';
import '../../data/datasorce/remote/profile_data.dart';

abstract class EditEmailVerifyCodeCotroller extends GetxController {
  verfyCodeAndGoToSuccessView({required verificationCode});
  resend();
}

class DelivaryEditEmailVerifyCodeCotrollerImp
    extends EditEmailVerifyCodeCotroller {
  late String userEmail;
  late String newEmail;

  StatusRequest? statusRequest = StatusRequest.none;

  DelivaryProfileData profileData = DelivaryProfileData(Get.find());
  MyServices myServices = Get.find();

  String? vrifyCode;

  @override
  verfyCodeAndGoToSuccessView({required verificationCode}) async {
    if (vrifyCode != null || vrifyCode!.length != 5) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await profileData.delivaryEditEmailVerifyCode(
        userEmail: userEmail,
        newEmail: newEmail,
        verifyCode: verificationCode,
      );

      debugPrint(
          '==================== Edit Email Verify Code Controller : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("email", newEmail);
          Get.offAll(StatusSuccessView(
            title: "تنبية",
            body: "تم تعديل البريد الالكترونى بنجاح",
            onPressed: () {
              Get.offAllNamed(AppRoute.delivaryHomeLayoutView);
            },
          ));
        } else {
          Get.defaultDialog(title: "تنبية", middleText: "رمز التحقق غير صحيح");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      Get.defaultDialog(
          title: "تنبية", middleText: "يجب ادخال رمز التحقق اولا");
    }
    update();
    // Get.toNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    userEmail = Get.arguments['userEmail'];
    newEmail = Get.arguments['newEmail'];
    super.onInit();
  }

  @override
  resend() {
    profileData.delivaryEditEmailReSendCode(
      userEmail: userEmail,
      newEmail: userEmail,
    );
    Get.defaultDialog(title: "تنبية", middleText: "تم اعاده ارسال رمز التحقق");
  }
}
