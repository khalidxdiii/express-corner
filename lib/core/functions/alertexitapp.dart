import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/approutes.dart';
import '../constant/colors.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    titleStyle: const TextStyle(
        fontWeight: FontWeight.bold, color: AppColor.primaryColor),
    title: "تنبية",
    middleText: "هل تريد الخروج من التطبيق ؟",
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text("نعم اريد الخروج"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("الغاء"),
      ),
    ],
  );
  return Future.value(true);
}

Future<bool> exitEditPage() {
  Get.offAllNamed(AppRoute.homeLayoutView);
  return Future.value(true);
}

Future<bool> delivaryExitEditPage() {
  Get.offAllNamed(AppRoute.delivaryHomeLayoutView);
  return Future.value(true);
}

Future<bool> alertDialog({
  required String title,
  required String middleText,
  required void Function()? onSubmit,
}) {
  Get.defaultDialog(
    titleStyle: const TextStyle(
        fontWeight: FontWeight.bold, color: AppColor.primaryColor),
    title: title,
    middleText: middleText,
    actions: [
      ElevatedButton(
        onPressed: onSubmit,
        child: const Text("موافق"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("الغاء"),
      ),
    ],
  );
  return Future.value(true);
}
