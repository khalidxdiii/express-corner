import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/services/services.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/approutes.dart';
import '../../../../core/localization/changelocal.dart';

abstract class SittingsController extends GetxController {
  showbottomSheet();
  logout2();
}

class SittingsControllerImp extends SittingsController {
  MyServices myServices = Get.find();
  LocalController localController = Get.find();
  bool isEnable = true;
  late String? userid;
  @override
  showbottomSheet() {
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
            const Text(
              "تسجيل الخروج",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black),
            ),
            const Text(
              "هل تريد تسجيل الخروج من حسابك على \n “Express Corner”؟",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            CustomDefultButton(
              text: "نعم , اريد ",
              onPressed: () {
                logout2();
              },
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
  logout2() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setString("step", "1");
    localController.changeLang("ar");

    Get.offAllNamed(AppRoute.login);
    myServices.sharedPreferences.setString("step", "1");
  }

  swithcNotifications(bool val) {
    isEnable = val;
    if (isEnable == true) {
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users$userid");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    }
    update();
  }

  @override
  void onInit() {
    userid = myServices.sharedPreferences.getString("id");
    super.onInit();
  }
}
