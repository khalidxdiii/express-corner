import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/services/services.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/approutes.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/localization/changelocal.dart';

import '../data/datasorce/remote/delivary_sitting_data.dart';

abstract class DelivarySittingsController extends GetxController {
  showbottomSheet();
  delivaryLogout();
  switchDelivaryStatusType(bool val);
  delivarySwitchNotifications(bool val);
  Future<bool> delivaryExitSittingPage();
}

class DelivarySittingsControllerImp extends DelivarySittingsController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  LocalController localController = Get.find();
  DelivarySittingData delivarySittingData = DelivarySittingData(Get.find());
  bool isNotificationsEnable = true;
  late bool isDelivaryAvilable;
  late String? delivaryId;
  late String delivaryStatusType;

  changeDelivaryStatusType({required String newDelivaryStatusType}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await delivarySittingData.changeDelivaryStatusType(
      deliveryid: myServices.sharedPreferences.getString("id").toString(),
      newDelivaryStatusType: newDelivaryStatusType,
    );
    debugPrint(
        '==================== Delivary Sitting Change Delivary Status Typr Controller $response');
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

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
                delivaryLogout();
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
  delivaryLogout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setString("step", "1");
    localController.changeLang("ar");

    Get.offAllNamed(AppRoute.login);
    myServices.sharedPreferences.setString("step", "1");
  }

  @override
  delivarySwitchNotifications(bool val) {
    isNotificationsEnable = val;
    if (isNotificationsEnable == true) {
      FirebaseMessaging.instance.subscribeToTopic("delivery");
      // FirebaseMessaging.instance.subscribeToTopic("delivary$userid");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("delivery");
      // FirebaseMessaging.instance.unsubscribeFromTopic("delivary$userid");
    }
    update();
  }

  @override
  switchDelivaryStatusType(bool val) {
    isDelivaryAvilable = val;
    if (isDelivaryAvilable != true) {
      delivaryStatusType = "notAvailable";
      changeDelivaryStatusType(newDelivaryStatusType: delivaryStatusType);
      myServices.sharedPreferences
          .setString("delivaryStatusType", delivaryStatusType);
    } else {
      delivaryStatusType = "available";
      changeDelivaryStatusType(newDelivaryStatusType: delivaryStatusType);
      myServices.sharedPreferences
          .setString("delivaryStatusType", delivaryStatusType);
    }
    update();
  }

  @override
  Future<bool> delivaryExitSittingPage() {
    Get.offAllNamed(AppRoute.delivaryHomeLayoutView);
    return Future.value(true);
  }

  @override
  void onInit() {
    delivaryId = myServices.sharedPreferences.getString("id");
    delivaryStatusType = Get.arguments["delivaryStatus"];
    // isDelivaryAvilable = delivaryStatusType == "available" ? true : false;
    super.onInit();
  }
}
