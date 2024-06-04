import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_icons_assets.dart';
import '../../../delivary_Layout/presentation/controllers/delivary_home_layout_controller.dart';
import 'delivary_select_option.dart';

class DelivaryProfileOptions extends GetView<DelivaryHomeLayoutControllerImp> {
  const DelivaryProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          DelivarySelectOption(
            text: "تعديل الملف الشخصى",
            icon: AppIconsAsset.shiledSvg,
            onTap: () {
              Get.toNamed(AppRoute.delivaryEditProfile,
                  arguments: {"delivaryModel": controller.delivaryInfoData});
            },
          ),
          DelivarySelectOption(
            text: "ملف الدليفرى",
            icon: AppIconsAsset.shiledSvg,
            onTap: () {
              Get.toNamed(AppRoute.delivaryWorkInfoView,
                  arguments: {"delivaryModel": controller.delivaryInfoData});
            },
          ),
          DelivarySelectOption(
            text: "تقيماتك",
            icon: AppIconsAsset.whoWeAre,
            onTap: () {
              Get.toNamed(AppRoute.delivaryRatingsView, arguments: {
                "averageRating":
                    controller.delivaryInfoData.first.averageRating,
                "totalRatings": controller.delivaryInfoData.first.totalRatings,
              });
            },
          ),
          DelivarySelectOption(
            text: 'من نحن',
            icon: AppIconsAsset.whoWeAre,
            onTap: () {
              Get.toNamed(AppRoute.delivaryWhoAreWe);
            },
          ),
          DelivarySelectOption(
            text: "المحفظة",
            icon: AppIconsAsset.payment,
            onTap: () {
              Get.toNamed(AppRoute.delivaryWallet);
            },
          ),
          DelivarySelectOption(
            text: "تواصل معنا",
            icon: AppIconsAsset.call,
            onTap: () {
              Get.toNamed(AppRoute.delivaryContactUs);
            },
          ),
          DelivarySelectOption(
            text: "الاعدادات",
            icon: AppIconsAsset.sittings,
            onTap: () {
              Get.toNamed(AppRoute.delivarySittings,
                  arguments: {"delivaryStatus": controller.delivaryStatusType});
            },
          ),
        ],
      ),
    );
  }
}
