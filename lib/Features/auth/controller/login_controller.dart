import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/approutes.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/services.dart';
import '../data/logindata.dart';

abstract class LoginCotroller extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginCotroller {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> key;

  StatusRequest? statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());
  List data = [];

  bool isShowPassword = true;

  MyServices myServices = Get.find();
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  login() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      debugPrint(
          '==================== Login Controller : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        statusRequest = StatusRequest.loading;
        update();
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['users_approve'] == '1') {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("password", response['data']['users_password']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences
                .setString("age", response['data']['users_age']);
            myServices.sharedPreferences
                .setString("gender", response['data']['users_gender']);
            myServices.sharedPreferences
                .setString("gov", response['data']['users_gov']);
            myServices.sharedPreferences
                .setString("city", response['data']['users_city']);
            myServices.sharedPreferences
                .setString("userimage", response['data']['users_image']);
            myServices.sharedPreferences.setString(
                "secretqustion", response['data']['users_secretqustion']);
            // myServices.sharedPreferences.setString("step", "2");

            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            String username = response['data']['users_name'];
            String useremail = response['data']['users_email'];

            if (response['data']['users_type'] == "0") {
              Get.offAllNamed(
                AppRoute.chooseUserType,
              );
            } else if (response['data']['users_type'] == "1") {
              myServices.sharedPreferences.setString("step", "3");
              Get.offAllNamed(AppRoute.homeLayoutView,
                  arguments: {"username": username, "email": useremail});
            } else if (response['data']['users_type'] == "2") {
              myServices.sharedPreferences.setString("step", "4");
              Get.offAllNamed(AppRoute.delivaryHomeLayoutView,
                  arguments: {"username": username, "email": useremail});
            }
          } else if (response['data']['users_approve'] == '2') {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            String delivaryId = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("password", response['data']['users_password']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences
                .setString("age", response['data']['users_age']);
            myServices.sharedPreferences
                .setString("gender", response['data']['users_gender']);
            myServices.sharedPreferences
                .setString("gov", response['data']['users_gov']);
            myServices.sharedPreferences
                .setString("city", response['data']['users_city']);
            myServices.sharedPreferences
                .setString("userimage", response['data']['users_image']);
            myServices.sharedPreferences.setString(
                "secretqustion", response['data']['users_secretqustion']);
            myServices.sharedPreferences.setString(
                "typtVehicle", response['data']['users_typeVehicle']);
            myServices.sharedPreferences
                .setString("expertise", response['data']['users_expertise']);
            // myServices.sharedPreferences.setString("step", "2");

            FirebaseMessaging.instance.subscribeToTopic("delivery");
            FirebaseMessaging.instance.subscribeToTopic("delivery$delivaryId");

            String username = response['data']['users_name'];
            String useremail = response['data']['users_email'];

            if (response['data']['users_type'] == "0") {
              Get.offAllNamed(
                AppRoute.chooseUserType,
              );
            } else if (response['data']['users_type'] == "1") {
              myServices.sharedPreferences.setString("step", "3");
              Get.offAllNamed(AppRoute.homeLayoutView,
                  arguments: {"username": username, "email": useremail});
            } else if (response['data']['users_type'] == "2") {
              myServices.sharedPreferences.setString("step", "4");
              Get.offAllNamed(AppRoute.delivaryHomeLayoutView,
                  arguments: {"username": username, "email": useremail});
            }
          } else {
            Get.toNamed(AppRoute.signUpVerifyCode,
                arguments: {"email": email.text.trim()});
          }
        } else {
          Get.defaultDialog(
              title: "Worrning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("//////////////////// Token : $value");
      // ignore: unused_local_variable
      String? token = value;
    });
    key = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();

    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setString("step", "1");

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
