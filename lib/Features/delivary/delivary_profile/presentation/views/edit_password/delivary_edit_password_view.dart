import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/class/handlingdataview.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/functions/validinput.dart';
import '../../../../../auth/presentation/widgets/custombuttomauth.dart';
import '../../../../../auth/presentation/widgets/customtextform.dart';
import '../../../../../auth/presentation/widgets/customtexttitle.dart';
import '../../../controllers/edit_password/edir_password_controller.dart';

class DelivaryEditPasswordView extends StatelessWidget {
  const DelivaryEditPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryEditPasswordCotrollerImp());

    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: GetBuilder<DelivaryEditPasswordCotrollerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.key,
            child: ListView(
              children: [
                const LogoAuth(isText: true, text: "تعديل كلمه المرور"),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextTitleAuth(
                        title: "تعديل كلمه المرور",
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormAuth(
                        hintText: "كلمه المرور القديمة",
                        lableText: "كلمه المرور القديمة",
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
                              val: value!, min: 5, max: 30, type: "password");
                        },
                      ),
                      CustomTextFormAuth(
                        hintText: "كلمه المرور الجديدة",
                        lableText: "كلمه المرور الجديدة",
                        iconData: Icons.lock_outline,
                        suffixIcon: controller.isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        myController: controller.newPassword,
                        isPassword: controller.isShowNewPassword,
                        onTapIcon: () {
                          controller.showNewPassword();
                        },
                        validator: (value) {
                          return validinput(
                              val: value!, min: 5, max: 30, type: "password");
                        },
                      ),
                      CustomTextFormAuth(
                        hintText: 'اعادة ادخال كلمة المرور',
                        lableText: 'اعادة ادخال كلمة المرور',
                        iconData: Icons.lock_outline,
                        suffixIcon: controller.isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        myController: controller.reNewPassword,
                        isPassword: controller.isShowReNewPassword,
                        onTapIcon: () {
                          controller.showReNewPassword();
                        },
                        validator: (value) {
                          return validinput(
                              val: value!, min: 5, max: 30, type: "password");
                        },
                      ),
                      CustomButtonAuth(
                        text: "تاكيد",
                        width: double.infinity,
                        onPressed: () {
                          controller.resetPassword();
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
    );
  }
}
