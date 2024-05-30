import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/alertexitapp.dart';
import '../../controllers/home_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Form(
      onWillPop: alertExitApp,
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {},
        //   shape: const CircleBorder(),
        //   backgroundColor: AppColor.primaryColor,
        //   child: const Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        // ),
        body: SafeArea(
          child: GetBuilder<HomeControllerImp>(
              builder: (controller) =>
                  controller.body[controller.currentIndex]),
        ),
      ),
    );
  }
}
