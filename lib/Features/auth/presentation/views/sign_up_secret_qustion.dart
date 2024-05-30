import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/validinput.dart';
import '../../controller/signup_secret_question_conrtoller.dart';
import '../widgets/custombuttomauth.dart';
import '../widgets/customtextbody.dart';
import '../widgets/customtextform.dart';
import '../widgets/customtexttitle.dart';
import '../widgets/logoauth.dart';

class SignUpSecretQuestion extends StatelessWidget {
  const SignUpSecretQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpSecretQuestionCotrollerImp());

    return Scaffold(
        body: SafeArea(
      child: GetBuilder<SignUpSecretQuestionCotrollerImp>(
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
                        title: 'الاسئلة الامنية',
                      ),
                      const SizedBox(height: 10),
                      const CustomTextBodyAuth(
                          text: 'أجب على الأسئلة الأمنية لاستعادة حسابك.'),
                      const SizedBox(height: 40),
                      const Text(
                        "ما هو اسم مغنيك المفضل",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GetBuilder<SignUpSecretQuestionCotrollerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          hintText: 'اكتب هنا',
                          lableText: '',
                          iconData: Icons.person,
                          myController: controller.secretQustion,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 30, type: "text");
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButtonAuth(
                        text: "تاكيد",
                        width: double.infinity,
                        onPressed: () {
                          controller.goToSuccessSignUp();
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
