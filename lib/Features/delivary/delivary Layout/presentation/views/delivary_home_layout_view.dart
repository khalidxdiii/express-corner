import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/delivary_home_controller.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class DelivaryHomeLayoutView extends StatelessWidget {
  const DelivaryHomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryHomeControllerImp());
    return Scaffold(
      bottomNavigationBar: const DelivaryCustomBottomNavigationBar(),
      body: SafeArea(
        child: GetBuilder<DelivaryHomeControllerImp>(
            builder: (controller) => controller.body[controller.currentIndex]),
      ),
    );
  }
}
