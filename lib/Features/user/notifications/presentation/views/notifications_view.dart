import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/notifications_controller.dart';
import '../widgets/notification_listview.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            Get.find<NotificationsControllerImp>().refreshNotification();
            return Future.value();
          },
          child: GetBuilder<NotificationsControllerImp>(
            builder: (controller) => HandlingDataView(
              isCenter: true,
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const LogoAuth(isText: true, text: "الاشعارات"),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.unreadNotificationCount} رسائل غير مقروئة",
                          style: const TextStyle(fontSize: 10),
                        ),
                        const SizedBox(height: 5),
                        const NotificationsListView()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
