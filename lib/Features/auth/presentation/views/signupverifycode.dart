import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/colors.dart';
import '../../controller/signup_verifycode_conrtoller.dart';
import '../widgets/custombuttomauth.dart';
import '../widgets/customtextbody.dart';
import '../widgets/customtexttitle.dart';
import '../widgets/logoauth.dart';

class SignUpVerifyCode extends StatelessWidget {
  const SignUpVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpVerifyCodeCotrollerImp());

    return Scaffold(
        backgroundColor: AppColor.backGround,
        body: SafeArea(
          child: GetBuilder<SignUpVerifyCodeCotrollerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: Container(
                child: ListView(
                  children: [
                    const LogoAuth(),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextTitleAuth(
                            title: 'رمز التحقق',
                          ),
                          const SizedBox(height: 10),
                          const CustomTextBodyAuth(
                              text:
                                  'تم ارسال رمز تاكيد على بريدك الالكترونى, تحقق منة وادخل رقم التحقق'),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.email,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "تعديل",
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20),
                          OtpTextField(
                            autoFocus: true,
                            focusedBorderColor: AppColor.primaryColor,
                            fieldWidth: 50.0,
                            borderRadius: BorderRadius.circular(10),
                            numberOfFields: 5,
                            borderColor: AppColor.primaryColor,
                            textStyle: const TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.vrifyCode = verificationCode;
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'لم يصلك الرمز؟ ',
                                style: TextStyle(fontSize: 10),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.resend();
                                },
                                child: const Center(
                                    child: Text(
                                  " اعادة الارسال",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          CustomButtonAuth(
                            text: "تاكيد",
                            width: double.infinity,
                            onPressed: () {
                              controller.goToSuccessSignUp(
                                  verificationCode: controller.vrifyCode);
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomButtonAuth(
                            text: "العودة لتسجيل الدخول",
                            width: double.infinity,
                            textColor: AppColor.primaryColor,
                            bgColor: AppColor.bgButtonSecColor,
                            onPressed: () {
                              controller.goToLogin();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
