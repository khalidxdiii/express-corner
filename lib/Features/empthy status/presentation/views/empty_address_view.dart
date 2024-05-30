import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imageasset.dart';
import '../controllers/empty_status_controller.dart';

class EmptyAddressView extends StatelessWidget {
  const EmptyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmptyStatusControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImageAsset.emptyAddress),
              const SizedBox(height: 20),
              const Text(
                'لا يوجد اى عنوان',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 15),
              const Text(
                'قم باضافة عنوان واطلب كل للى تحتاجة.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
