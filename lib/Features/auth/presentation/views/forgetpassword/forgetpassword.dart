import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../widgets/custombuttomauth.dart';
import '../../widgets/customtextbody.dart';
import '../../widgets/customtextform.dart';
import '../../widgets/customtexttitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // ForgetPasswordCotrollerImp controller =
    //     Get.put(ForgetPasswordCotrollerImp());

    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: GetBuilder<ForgetPasswordCotrollerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Container(
            child: Form(
              key: controller.key,
              child: ListView(
                children: [
                  const LogoAuth(),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextTitleAuth(
                          title: " نسيان كلمة السر",
                        ),
                        const SizedBox(height: 10),
                        const CustomTextBodyAuth(
                            text:
                                " لا تقلق يمكنك التحقق لكلمة السر من خلال الهاتف المسجل لدينا"),
                        const SizedBox(height: 20),
                        CustomTextFormAuth(
                          hintText: "البريد الالكترونى",
                          lableText: "البريد الالكترونى",
                          iconData: Icons.email,
                          myController: controller.email,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 100, type: "email");
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomButtonAuth(
                          text: "تاكيد",
                          width: double.infinity,
                          onPressed: () {
                            controller.checkEmail();
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomButtonAuth(
                          text: "العودة لتسجيل الدخول",
                          width: double.infinity,
                          textColor: AppColor.primaryColor,
                          bgColor: AppColor.bgButtonSecColor,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 
