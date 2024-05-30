import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/delivary_who_we_are_content.dart';
import '../widgets/delivary_who_we_are_logo.dart';

class DelivaryWhoAreWeView extends StatelessWidget {
  const DelivaryWhoAreWeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              // height: Get.height + 50,
              height: 870,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const DelivaryWhoWeAreLogo(
                    text: "من نحن",
                  ),
                  Positioned(
                    top: 190,
                    child: SizedBox(
                      // height: Get.height + 200,
                      width: Get.width - 40,
                      child: const DelivaryWhoWeAreContent(),
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
