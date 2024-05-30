import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imageasset.dart';
import '../../../auth/presentation/widgets/custombuttomauth.dart';
import '../controllers/empty_status_controller.dart';

class NotificationEmptyView extends StatelessWidget {
  const NotificationEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    EmptyStatusControllerImp controller = Get.put(EmptyStatusControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 20,
              top: 20,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                      child: Icon(
                        Icons.arrow_back,
                        size: 13,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "رجوع",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImageAsset.notification),
                  // const SizedBox(height: 10),
                  const Text(
                    'لا يوجد إشعارات',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'ليس لديك اى اشعارات حتى الان يرجى',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: Get.width - 150,
                    child: CustomButtonAuth(
                      text: "الرئيسية",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
