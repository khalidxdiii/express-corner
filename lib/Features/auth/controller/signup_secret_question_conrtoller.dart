import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/approutes.dart';
import '../../../../core/functions/handlingdata.dart';
import '../data/signupdata.dart';

abstract class SignUpSecretQuestionCotroller extends GetxController {
  goToSuccessSignUp();
  goToLogin();
}

class SignUpSecretQuestionCotrollerImp extends SignUpSecretQuestionCotroller {
  StatusRequest? statusRequest = StatusRequest.none;
  late TextEditingController secretQustion;
  late String? username;
  late String? email;
  late String? password;
  late String? phone;
  late String? age;
  late String? gender;
  late String? gov;
  late String? city;

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];

  @override
  goToSuccessSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postData(
      username: username!,
      email: email!,
      password: password!,
      phone: phone!,
      age: age!,
      gender: gender!,
      gov: gov!,
      city: city!,
      secretqustion: secretQustion.text,
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
        Get.defaultDialog(title: "Worrning", middleText: "try again");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    // Get.toNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    username = Get.arguments['username'];
    password = Get.arguments['password'];
    phone = Get.arguments['phone'];
    age = Get.arguments['age'];
    gender = Get.arguments['gender'];
    gov = Get.arguments['gov'];
    city = Get.arguments['city'];
    secretQustion = TextEditingController();
    super.onInit();
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
