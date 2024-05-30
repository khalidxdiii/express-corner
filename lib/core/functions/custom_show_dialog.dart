import 'package:express_corner/Features/user/home%20Layout/controllers/home_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/approutes.dart';
import '../constant/colors.dart';
import '../localization/changelocal.dart';
import '../services/services.dart';
import '../shared/defult_button.dart';

MyServices myServices = Get.find();
LocalController localController = Get.find();

showbottomSheet(
    {required String title,
    required String body,
    required void Function() onConfirm}) {
  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      width: double.infinity,
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xffEBEBEB),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.black),
          ),
          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          CustomDefultButton(
            text: "نعم , اريد ",
            onPressed: onConfirm,
          ),
          const SizedBox(height: 10),
          CustomDefultButton(
            text: "الغاء الامر",
            isSecButton: true,
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    ),
  );
}

@override
userLogout() {
  String userid = myServices.sharedPreferences.getString("id")!;
  FirebaseMessaging.instance.unsubscribeFromTopic("users");
  FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
  Get.offAllNamed(AppRoute.login);
  myServices.sharedPreferences.setString("step", "1");
}

@override
delivaryLogout() {
  String delivaryid = myServices.sharedPreferences.getString("id")!;
  FirebaseMessaging.instance.unsubscribeFromTopic("delivary");
  FirebaseMessaging.instance.unsubscribeFromTopic("delivary$delivaryid");
  Get.offAllNamed(AppRoute.login);
  myServices.sharedPreferences.setString("step", "1");
}
