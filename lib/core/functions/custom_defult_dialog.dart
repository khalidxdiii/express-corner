import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

customDefultDialog(
    {required String title,
    required String middleText,
    String? textConfirm = "موافق",
    required void Function() onConfirm}) {
  Get.defaultDialog(
    title: title,
    middleText: middleText,
    textConfirm: textConfirm,
    buttonColor: AppColor.primaryColor,
    confirmTextColor: Colors.white,
    titleStyle: const TextStyle(
        color: AppColor.primaryColor, fontWeight: FontWeight.bold),
    onConfirm: onConfirm,
  );
}
