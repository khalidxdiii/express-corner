import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';
import '../../controllers/onboarding_controller.dart';

class CustomSliderOnBoarding extends GetView<OnBoradingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            // SizedBox(height: Get.height / 25.1),
            SizedBox(
                // width: double.infinity,
                height: Get.width / 1.2,
                child: Image.asset(onBoardingList[i].image!)),
            const SizedBox(height: 30),

            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColor.black),
            ),
            // RichText(text: TextSpan(text:  , style: ))
            const SizedBox(height: 20),
            Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 2,
                  color: AppColor.gray,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}
