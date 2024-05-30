import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/custom_show_dialog.dart';
import '../../../../../core/shared/defult_button.dart';
import '../../../delivary Layout/presentation/controllers/delivary_home_controller.dart';
import '../../controllers/delivary_profile_controller.dart';
import '../../controllers/delivary_sittings_controller.dart';
import '../widgets/delivary_select_option.dart';

class DelivarySittingsView extends StatelessWidget {
  const DelivarySittingsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivarySittingsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "الاعدادات",
            ),
            GetBuilder<DelivarySittingsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: WillPopScope(
                  onWillPop: controller.delivaryExitSittingPage,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              DelivarySelectOption(
                                text: 'الحالة',
                                icon: AppIconsAsset.delivaryStatusType,
                                isSwitch: true,
                                checkValue:
                                    controller.delivaryStatusType == "available"
                                        ? true
                                        : false,
                                onChanged: (value) {
                                  controller.switchDelivaryStatusType(value!);
                                },
                                onTap: () {},
                                subtitle: controller.delivaryStatusType ==
                                        "available"
                                    ? const Text(
                                        "متاح للتوصيل",
                                        style: TextStyle(
                                            color: AppColor.primaryColor),
                                      )
                                    : Text(
                                        "غير متاح للتوصيل",
                                        style:
                                            TextStyle(color: Colors.red[500]),
                                      ),
                              ),
                              DelivarySelectOption(
                                text: 'الاشعارات',
                                icon: AppIconsAsset.settingNotifications,
                                isSwitch: true,
                                checkValue: controller.isNotificationsEnable,
                                onChanged: (value) {
                                  controller
                                      .delivarySwitchNotifications(value!);
                                },
                                onTap: () {},
                              ),
                              DelivarySelectOption(
                                text: "مشاركة التطبيق",
                                icon: AppIconsAsset.shiledSvg,
                                onTap: () {},
                              ),
                              DelivarySelectOption(
                                text: 'الاسئلة المكررة',
                                icon: AppIconsAsset.qustionsSvg,
                                onTap: () {
                                  Get.toNamed(AppRoute.delivaryQna);
                                },
                              ),
                              DelivarySelectOption(
                                text: "تعديل البريد الالكترونى",
                                icon: AppIconsAsset.password,
                                onTap: () {
                                  Get.toNamed(
                                      AppRoute.delivaryProfileEditEmail);
                                },
                              ),
                              DelivarySelectOption(
                                text: "تعديل كلمة المرور",
                                icon: AppIconsAsset.password,
                                onTap: () {
                                  Get.toNamed(
                                      AppRoute.delivaryProfileEditPasswordView);
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
                                delivaryLogout();
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
