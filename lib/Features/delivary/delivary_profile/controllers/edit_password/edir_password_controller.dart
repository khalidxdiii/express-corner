import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';
import '../../../../empthy status/presentation/views/status_success_view.dart';
import '../../data/datasorce/remote/profile_data.dart';

abstract class EditPasswordCotroller extends GetxController {
  resetPassword();
  goToLogin();
}

class DelivaryEditPasswordCotrollerImp extends EditPasswordCotroller {
  late TextEditingController password;
  late TextEditingController newPassword;
  late TextEditingController reNewPassword;
  late GlobalKey<FormState> key;

  StatusRequest statusRequest = StatusRequest.none;
  DelivaryProfileData profileData = DelivaryProfileData(Get.find());
  MyServices myServices = Get.find();
  late String email;

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  bool isShowNewPassword = true;
  showNewPassword() {
    isShowNewPassword = !isShowNewPassword;
    update();
  }

  bool isShowReNewPassword = true;
  showReNewPassword() {
    isShowReNewPassword = !isShowReNewPassword;
    update();
  }

  @override
  resetPassword() async {
    if (newPassword.text.trim() != reNewPassword.text.trim()) {
      return Get.defaultDialog(
          title: "تنبية", middleText: "كلمة المرور غير متطابقة");
    }
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await profileData.delivaryEditPassword(
        email: myServices.sharedPreferences.getString("email")!,
        password: password.text.trim(),
        newPassword: newPassword.text.trim(),
      );

      debugPrint(
          '==================== Reset Password Cotroller  : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        update();
        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("password", newPassword.text);
          Get.offAll(StatusSuccessView(
            title: "تنبية",
            body: "تم تعديل كلمة المرور بنجاح",
            onPressed: () {
              Get.offAllNamed(AppRoute.homeLayoutView);
            },
          ));
        } else if (response['message'] == "Incorrect password") {
          Get.defaultDialog(
              title: "تنبية", middleText: "كلمه المرور القديمة غير صحيحة");
        } else {
          Get.defaultDialog(title: "تنبية", middleText: "حاول مرة اخرى");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    // email = Get.arguments['email'];
    email = "";
    key = GlobalKey<FormState>();
    password = TextEditingController();
    newPassword = TextEditingController();
    reNewPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    newPassword.dispose();
    reNewPassword.dispose();
    super.dispose();
  }
}
