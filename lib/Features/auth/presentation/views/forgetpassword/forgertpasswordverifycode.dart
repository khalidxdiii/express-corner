import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/colors.dart';
import '../../../controller/forgetpassword/forgetpasswordverifycode_controller.dart';
import '../../widgets/custombuttomauth.dart';
import '../../widgets/customtextbody.dart';
import '../../widgets/customtexttitle.dart';
import '../../widgets/logoauth.dart';

class ForgetPasswordVerifyCode extends StatelessWidget {
  const ForgetPasswordVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordVerifyCodeCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.backGround,
        body: GetBuilder<ForgetPasswordVerifyCodeCotrollerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              child: ListView(
                children: [
                  const LogoAuth(),
                  const SizedBox(height: 20),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextTitleAuth(
                          title: ' نسيان كلمة السر',
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
                            controller.codesms = verificationCode;
                            // controller.checkphone(verificationCode);
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
                                controller.verfyCode();
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
                            controller.goToResetPassword(
                                verificationCode: controller.codesms!);
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
        ));
  }
}
