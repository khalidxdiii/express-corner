import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';
import 'dotconttroler.dart';
import 'onboardingButton.dart';
import 'slidercontroller.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoradingControllerImp controller = Get.put(OnBoradingControllerImp());
    return Scaffold(
      // backgroundColor: AppColor.backGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Expanded(flex: 4, child: CustomSliderOnBoarding()),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const CustomDotControllerOnBoarding(),
                    // SlideingText(),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: OnboardingButton(
                              text: "8".tr,
                              isNext: true,
                              onPressed: () {
                                controller.nextPage();
                              },
                            )),
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                            child: OnboardingButton(
                          text: "skip".tr,
                          onPressed: () {
                            controller.skip();
                          },
                          bgColor: Colors.white,
                          textColor: AppColor.primaryColor,
                        )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
