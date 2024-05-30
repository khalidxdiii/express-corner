// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/approutes.dart';
import '../../../../core/services/services.dart';
import '../../data/datasource/static/static.dart';

abstract class OnBoradingController extends GetxController {
  nextPage();
  onPageChanged(int index);
  skip();
}

class OnBoradingControllerImp extends OnBoradingController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  nextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      if (pageController.hasClients) {
        pageController.animateToPage(currentPage,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOut);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  skip() {
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }
}
