import 'package:express_corner/Features/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/imageasset.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashControllerImp());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: Get.width - 200,
            child: Image.asset(
              AppImageAsset.logo,
            ),
          ),
        ),
      ],
    );
  }
}
