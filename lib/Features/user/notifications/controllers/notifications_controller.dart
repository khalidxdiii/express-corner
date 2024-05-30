import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/approutes.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/services.dart';
import '../data/datasorce/remote/notifications_data.dart';
import '../data/models/notification_model.dart';

abstract class NotificationsController extends GetxController {
  getNotification();
  readNotification({required String orderId, required String notificationID});
  refreshNotification();
}

class NotificationsControllerImp extends NotificationsController {
  NotificationData notificationData = NotificationData(Get.find());
  List<NotificationModel> dataNotification = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  int unreadNotificationCount = 0;

  @override
  getNotification() async {
    dataNotification.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.getData(
        usersid: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Notification Controller $response');
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        dataNotification
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));

        // Sort notifications by notification Datetime
        dataNotification.sort((b, a) =>
            a.notificationDatetime!.compareTo(b.notificationDatetime!));

        // Reset unread notifications count
        unreadNotificationCount = 0;

        // Iterate over notifications to count unread ones
        for (var notification in dataNotification) {
          if (notification.notificationIsread == 0) {
            unreadNotificationCount++;
          }
        }
      } else {
        statusRequest = StatusRequest.emptyNotification;
      }
    }
    update();
  }

  @override
  readNotification(
      {required String orderId, required String notificationID}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.readNorification(
      usersid: myServices.sharedPreferences.getString("id")!,
      notificationID: notificationID,
    );
    debugPrint('==================== Notification Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.ordersStatus, arguments: {"orderId": orderId});
      } else {
        statusRequest = StatusRequest.emptyNotification;
      }
    }
    update();
  }

  @override
  refreshNotification() async {
    dataNotification.clear();
    await getNotification();
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
