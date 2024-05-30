import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/notifications_controller.dart';
import 'notification_card_item.dart';

class NotificationsListView extends GetView<NotificationsControllerImp> {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return NotificationsCardItem(
          title: controller.dataNotification[index].notificationTitle!,
          body: controller.dataNotification[index].notificationBody!,
          type: controller.dataNotification[index].notificationType!,
          isRead: controller.dataNotification[index].notificationIsread! == 0
              ? false
              : true,
          onTap: () {
            controller.readNotification(
                notificationID: controller
                    .dataNotification[index].notificationId
                    .toString(),
                orderId: controller.dataNotification[index].notificationData
                    .toString());
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: controller.dataNotification.length,
    );
  }
}
