import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/approutes.dart';
import '../../../../core/localization/changelocal.dart';
import 'widgets/custombuttonlang.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "1".tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonLang(
                text: 'AR',
                onPressed: () {
                  controller.changeLang("ar");
                  Get.offNamed(AppRoute.onBoarding);
                },
              ),
              CustomButtonLang(
                text: 'EN',
                onPressed: () {
                  controller.changeLang("en");
                  Get.offNamed(AppRoute.onBoarding);
                },
              ),
            ]),
      ),
    );
  }
}
