import 'package:express_corner/core/class/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../data/forgetpassword/verifycodeforgetpassworddata.dart';

abstract class ForgetPasswordVerifyCodeCotroller extends GetxController {
  verfyCode();
  goToResetPassword({required String verificationCode});
  goToLogin();
}

class ForgetPasswordVerifyCodeCotrollerImp
    extends ForgetPasswordVerifyCodeCotroller {
  StatusRequest? statusRequest = StatusRequest.none;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());

  late String email;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? codesms = "123456";

  @override
  verfyCode() {}

  @override
  goToResetPassword({required String verificationCode}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postData(
      email: email,
      verifycode: verificationCode,
    );

    debugPrint(
        '==================== Forget Password Verify Code Cotroller Controller : $response  ===================');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      statusRequest = StatusRequest.loading;
      update();
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.toNamed(AppRoute.resetPassword, arguments: {
          'email': email,
        });
      } else {
        Get.defaultDialog(
            title: "Worrning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkphone(String smsCode1) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+201272781129',
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = smsCode1;

        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  testotp(String otp) async {
    AuthService.sentOtp(
        errorStep: () {},
        nextStep: () {
          AuthService.verifyOtp(otp: otp).then((value) {
            if (value == "success") {
              print("/////////////////////////////////");
              print("Ok");
            } else {
              print("/////////////////////////////////");
              print("Error testotp");
            }
          });
        });
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    // email = "";
    super.onInit();
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
