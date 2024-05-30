import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../data/forgetpassword/resetpassworddata.dart';

abstract class ResetPasswordCotroller extends GetxController {
  resetPassword();
  goToLogin();
}

class ResetPasswordCotrollerImp extends ResetPasswordCotroller {
  late TextEditingController password;
  late TextEditingController repassword;
  late GlobalKey<FormState> key;

  StatusRequest? statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late String email;

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  bool isShowRePassword = true;
  showRePassword() {
    isShowRePassword = !isShowRePassword;
    update();
  }

  @override
  resetPassword() async {
    if (password.text.trim() != repassword.text.trim()) {
      return Get.defaultDialog(
          title: "Worning", middleText: "Password Not Match");
    }
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await resetPasswordData.postData(
        email: email,
        password: password.text.trim(),
      );

      debugPrint(
          '==================== Reset Password Cotroller  : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        statusRequest = StatusRequest.loading;
        update();
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: "Worrning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      Get.offAllNamed(AppRoute.successResetPassword);
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    // email = "";
    key = GlobalKey<FormState>();
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
