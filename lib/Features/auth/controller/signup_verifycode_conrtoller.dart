import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/approutes.dart';
import '../../../../core/functions/handlingdata.dart';
import '../data/signupverifycodedata.dart';

abstract class SignUpVerifyCodeCotroller extends GetxController {
  goToSuccessSignUp({required verificationCode});
  goToLogin();
  resend();
}

class SignUpVerifyCodeCotrollerImp extends SignUpVerifyCodeCotroller {
  late String email;

  StatusRequest? statusRequest = StatusRequest.none;
  late TextEditingController secretQustion;

  SignUpVerifyCodeData signUpData = SignUpVerifyCodeData(Get.find());
  List data = [];
  String? vrifyCode;

  @override
  goToSuccessSignUp({required verificationCode}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postData(
      email: email,
      verifyCode: verificationCode,
    );

    debugPrint(
        '==================== SignUpVerifyCode Controller : $response  ===================');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      statusRequest = StatusRequest.loading;
      update();
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Worrning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    // Get.toNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    secretQustion = TextEditingController();
    super.onInit();
  }

  @override
  resend() {
    signUpData.resendData(
      email: email,
    );
  }

  @override
  void dispose() {
    secretQustion.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
