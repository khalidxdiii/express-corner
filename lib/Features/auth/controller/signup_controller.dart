import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/approutes.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../core/controller/gov_city_controller.dart';

import '../data/signupdata.dart';

abstract class SignUpCotroller extends GetxController {
  signUp();
  goToLogin();
  refreshPage();
}

class SignUpCotrollerImp extends GovCityControllerImp {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController repassword;
  late TextEditingController age;

  late GlobalKey<FormState> key;

  SignUpData signUpData = SignUpData(Get.find());

  List data = [];

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  bool isShowRePassword = true;
  showrePassword() {
    isShowRePassword = !isShowRePassword;
    update();
  }

  bool isAgree = false;
  changeAgree() {
    isAgree = !isAgree;
    update();
  }

  signUp() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signUpData.postData(
        username: username.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        phone: phone.text.trim(),
        age: age.text,
        gender: genderName.text,
        gov: govName.text,
        city: cityName.text,
        secretqustion: "",
      );

      debugPrint(
          '==================== SignUp Controller : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        statusRequest = StatusRequest.loading;
        update();
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.signUpVerifyCode, arguments: {
            "email": email.text.trim(),
          });
          statusRequest = StatusRequest.success;
        } else {
          Get.defaultDialog(
              title: "تنبية",
              middleText: "البريد الإلكتروني أو رقم الهاتف موجود بالفعل");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignUpCotrollerImp>();
    }
  }

  signUptest() async {
    if (key.currentState!.validate()) {
      debugPrint('==================== SignUp Controller  ===================');

      statusRequest = StatusRequest.loading;
      update();
      if (password.text.trim() == repassword.text.trim()) {
        if (genderName.text == '') {
          Get.defaultDialog(title: "تنبية", middleText: "برجاء اختيار النوع");
          statusRequest = StatusRequest.failure;
        } else {
          if (govName.text == '') {
            Get.defaultDialog(
                title: "تنبية", middleText: "برجاء اختيار المحافظة");
            statusRequest = StatusRequest.failure;
          } else {
            if (cityName.text == '') {
              Get.defaultDialog(
                  title: "تنبية", middleText: "برجاء اختيار المدينة");
              statusRequest = StatusRequest.failure;
            } else {
              if (isAgree == true) {
                Get.toNamed(AppRoute.signUpSecretQuestion, arguments: {
                  "username": username.text.trim(),
                  "email": email.text.trim(),
                  "password": password.text,
                  "phone": phone.text,
                  "age": age.text,
                  "gender": genderName.text,
                  "gov": govName.text,
                  "city": cityName.text,
                });
              } else {
                Get.defaultDialog(
                    title: "تنبية", middleText: "برجاء الموافقة على الشروط");
                statusRequest = StatusRequest.failure;
              }
            }
          }
        }
      } else {
        Get.defaultDialog(title: "تنبية", middleText: "كلمة السر غير متطابقة");
        statusRequest = StatusRequest.failure;
      }

      update();

      // Get.delete<SignUpCotrollerImp>();
    }
  }

  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    key = GlobalKey<FormState>();
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    age = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    repassword.dispose();
    age.dispose();

    super.dispose();
  }
}
