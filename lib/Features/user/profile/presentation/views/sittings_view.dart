import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/custom_show_dialog.dart';
import '../../../../../core/shared/defult_button.dart';
import '../../controllers/sittings_controller.dart';
import '../widgets/select_option.dart';

class SittingsView extends StatelessWidget {
  const SittingsView({super.key});

  @override
  Widget build(BuildContext context) {
    SittingsControllerImp controller = Get.put(SittingsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "الاعدادات",
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        GetBuilder<SittingsControllerImp>(
                          builder: (controller) => SelectOption(
                            text: 'الاشعارات',
                            icon: AppIconsAsset.qustionsSvg,
                            isSwitch: true,
                            checkValue: controller.isEnable,
                            onChanged: (value) {
                              controller.swithcNotifications(value!);
                            },
                            onTap: () {},
                          ),
                        ),
                        SelectOption(
                          text: "تعديل البريد الالكترونى",
                          icon: AppIconsAsset.password,
                          onTap: () {
                            Get.toNamed(AppRoute.profileEditEmail);
                          },
                        ),
                        SelectOption(
                          text: "تعديل كلمة المرور",
                          icon: AppIconsAsset.password,
                          onTap: () {
                            Get.toNamed(AppRoute.profileEditPasswordView);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomDefultButton(
                    text: "تسجيل الخروج",
                    isShowIcon: true,
                    onPressed: () {
                      showbottomSheet(
                        title: "تسجيل الخروج",
                        body:
                            "هل تريد تسجيل الخروج من حسابك على \n “Express Corner”؟",
                        onConfirm: () {
                          userLogout();
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
