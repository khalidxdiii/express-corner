import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../data/forgetpassword/checkemaildata.dart';

abstract class ForgetPasswordCotroller extends GetxController {
  checkEmail();
}

class ForgetPasswordCotrollerImp extends ForgetPasswordCotroller {
  late TextEditingController email;
  late GlobalKey<FormState> key;

  StatusRequest? statusRequest = StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  @override
  checkEmail() async {
    statusRequest = StatusRequest.loading;
    var response = await checkEmailData.postData(
      email: email.text.trim(),
    );

    debugPrint(
        '==================== Forget Password Controller : $response  ===================');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      statusRequest = StatusRequest.loading;
      update();
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.forgetPasswordVerfiyCode, arguments: {
          "email": email.text.trim(),
        });
      } else {
        Get.defaultDialog(title: "Worrning", middleText: "Email Not Found");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    key = GlobalKey<FormState>();
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
