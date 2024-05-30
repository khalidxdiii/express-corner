import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imageasset.dart';

import '../../../auth/presentation/widgets/custombuttomauth.dart';
import '../controllers/empty_status_controller.dart';

class SavedEmptyView extends StatelessWidget {
  const SavedEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    EmptyStatusControllerImp controller = Get.put(EmptyStatusControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const CustomArrowBack(),
              Image.asset(AppImageAsset.saved),
              const SizedBox(height: 20),
              const Text(
                'لا يوجد حفظ لشئ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 15),
              const Text(
                'ليس لديك أي أماكن محفوظة، يرجى العثور عليها في البحث لحفظ الاماكن.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: Get.width - 150,
                child: CustomButtonAuth(
                  text: "تصفح الان",
                  onPressed: () {
                    controller.goToHome();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
