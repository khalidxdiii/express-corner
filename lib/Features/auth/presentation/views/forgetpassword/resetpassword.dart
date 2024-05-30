import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../widgets/custombuttomauth.dart';
import '../../widgets/customtextbody.dart';
import '../../widgets/customtextform.dart';
import '../../widgets/customtexttitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.backGround,
        body: GetBuilder<ResetPasswordCotrollerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextTitleAuth(
                              title: 'انشاء كلمة سر جديدة',
                            ),
                            const SizedBox(height: 10),
                            const CustomTextBodyAuth(
                                text:
                                    'يرجى اضافة كلمة سر جيدة للحفاظ على بياناتك'),
                            const SizedBox(height: 20),
                            CustomTextFormAuth(
                              hintText: 'كلمة السر',
                              lableText: 'كلمة السر',
                              iconData: Icons.lock_outline,
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
                            CustomTextFormAuth(
                              hintText: 'اعادة ادخال كلمة السر',
                              lableText: 'اعادة ادخال كلمة السر',
                              iconData: Icons.lock_outline,
                              suffixIcon: controller.isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              myController: controller.repassword,
                              isPassword: controller.isShowRePassword,
                              onTapIcon: () {
                                controller.showRePassword();
                              },
                              validator: (value) {
                                return validinput(
                                    val: value!,
                                    min: 5,
                                    max: 30,
                                    type: "password");
                              },
                            ),
                            const SizedBox(height: 40),
                            const Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: AppColor.primaryColor,
                                      size: 12,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "يجب الا تحتوى على اسمك او بريدك الالكترونى",
                                      style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 12,
                                        height: .9,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: AppColor.gray,
                                      size: 12,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "8 احرف على الاقل",
                                      style: TextStyle(
                                        color: AppColor.gray,
                                        fontSize: 12,
                                        height: .9,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomButtonAuth(
                              text: "تاكيد",
                              width: double.infinity,
                              onPressed: () {
                                controller.resetPassword();
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
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
