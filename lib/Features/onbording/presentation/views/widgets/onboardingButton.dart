// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/colors.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingButton extends GetView<OnBoradingControllerImp> {
  const OnboardingButton(
      {super.key,
      this.isNext = false,
      required this.text,
      required this.onPressed,
      this.bgColor = AppColor.primaryColor,
      this.textColor = Colors.white});
  final Color bgColor;
  final Color textColor;
  final String text;
  final void Function() onPressed;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        textColor: textColor,
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isNext,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_rounded),
                  SizedBox(width: 5),
                ],
              ),
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
