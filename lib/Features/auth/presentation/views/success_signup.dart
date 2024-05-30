import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/success_signup_controller.dart';
import '../widgets/custombuttomauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpCotrollerImp controller = Get.put(SuccessSignUpCotrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImageAsset.ok),
              const SizedBox(height: 20),
              const Text(
                'تم انشاء حسابك بنجاح',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 15),
              const Text(
                'الآن، يمكنك الاستمتاع بتجربة توصيل سريعة وسهلة واختر ما تريد من كل متجر أو مطعم.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: Get.width - 150,
                child: CustomButtonAuth(
                  text: "الرئيسية",
                  onPressed: () {
                    controller.goToLogin();
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
