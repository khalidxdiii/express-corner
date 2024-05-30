import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/alertexitapp.dart';
import '../../../../core/functions/validinput.dart';
import '../../controller/login_controller.dart';
import '../widgets/custom_signin_with_fb_or_gmail.dart';
import '../widgets/custombuttomauth.dart';
import '../widgets/customtextbody.dart';
import '../widgets/customtextform.dart';
import '../widgets/customtextsignuporsigin.dart';
import '../widgets/customtexttitle.dart';
import '../widgets/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextTitleAuth(
                            title: 'مرحبا بك مرة أخرى 👋',
                          ),
                          const SizedBox(height: 10),
                          const CustomTextBodyAuth(
                              text: ' اهلا بك!  يرجى ادخال معلومات التسجيل'),
                          const SizedBox(height: 20),
                          CustomTextFormAuth(
                            hintText: 'البريد الالكترونى',
                            lableText: 'البريد الالكترونى',
                            iconData: Icons.person,
                            myController: controller.email,
                            validator: (value) {
                              return validinput(
                                  val: value!, min: 5, max: 100, type: "email");
                            },
                          ),
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => CustomTextFormAuth(
                              hintText: 'كلمة السر',
                              lableText: 'كلمة السر',
                              iconData: Icons.lock,
                              suffixIcon: controller.isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              myController: controller.password,
                              isPassword: controller.isShowPassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              validator: (value) {
                                return validinput(
                                    val: value!,
                                    min: 5,
                                    max: 30,
                                    type: "password");
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                activeColor: AppColor.primaryColor,
                                onChanged: (value) {},
                              ),
                              const Text(
                                "تذكرنى؟",
                                style: TextStyle(fontSize: 12),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: const Text(
                                  'نسيت كلمة السر؟',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  // textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          CustomButtonAuth(
                            text: 'تسجيل الدخول',
                            onPressed: () {
                              controller.login();
                            },
                            width: double.infinity,
                          ),
                          const SizedBox(height: 20),
                          CustomTextSignUpOrSignIn(
                            textOne: 'ليس لديك حساب؟ ',
                            textTwo: 'إنشاء حساب جديد',
                            onTap: () {
                              controller.goToSignUp();
                            },
                          ),
                          const SizedBox(height: 20),
                          const CustomSignInWithFbOrGmail(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
