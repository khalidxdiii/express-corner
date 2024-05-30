import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_icons_assets.dart';
import 'select_option.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        SelectOption(
          text: 'من نحن',
          icon: AppIconsAsset.whoWeAre,
          onTap: () {
            Get.toNamed(AppRoute.whoAreWe);
          },
        ),
        // SelectOption(
        //   text: "طريقة الدفع",
        //   icon: AppIconsAsset.payment,
        //   onTap: () {
        //     Get.toNamed(AppRoute.paymentMethod);
        //   },
        // ),
        SelectOption(
          text: "عناوينى",
          icon: AppIconsAsset.location,
          onTap: () {
            Get.toNamed(AppRoute.addressView);
          },
        ),
        SelectOption(
          text: "تواصل معنا",
          icon: AppIconsAsset.call,
          onTap: () {
            Get.toNamed(AppRoute.contactUs);
          },
        ),
        SelectOption(
          text: "الاعدادات",
          icon: AppIconsAsset.sittings,
          onTap: () {
            Get.toNamed(AppRoute.sittings);
          },
        ),
        SelectOption(
          text: "مشاركة التطبيق",
          icon: AppIconsAsset.shiledSvg,
          onTap: () {},
        ),
        SelectOption(
          text: 'الاسئلة المكررة',
          icon: AppIconsAsset.qustionsSvg,
          onTap: () {
            Get.toNamed(AppRoute.qna);
          },
        ),
        SelectOption(
          text: 'سياسة الخصوصية',
          icon: AppIconsAsset.shiledSvg,
          onTap: () {},
        ),
      ]),
    );
  }
}
