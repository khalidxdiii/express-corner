import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../controller/forgetpassword/success_resetpassword_controller.dart';
import '../../widgets/custombuttomauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordCotrollerImp controller =
        Get.put(SuccessResetPasswordCotrollerImp());
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
                "تم تغيير كلمة السر بنجاح",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 15),
              const Text(
                " حاول الاحتفاظ بكلمة السر بعيدا لتفادى سرقة بياناتك.",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: Get.width - 150,
                child: CustomButtonAuth(
                  text: "تسجيل الدخول",
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
