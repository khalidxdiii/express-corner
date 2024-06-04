import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constant/app_icons_assets.dart';
import '../../controllers/delivary_home_layout_controller.dart';

class DelivaryCustomBottomNavigationBar
    extends GetView<DelivaryHomeLayoutControllerImp> {
  const DelivaryCustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DelivaryHomeLayoutControllerImp>(
      builder: (controller) => BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: AppColor.gray,
        selectedItemColor: AppColor.primaryColor,
        currentIndex: controller.currentIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: (value) {
          controller.changePage(value);
        },
        items: [
          BottomNavigationBarItem(
            label: "الرئيسية",
            icon: controller.currentIndex == 0
                ? const Icon(
                    Iconsax.home_15,
                  )
                : const Icon(Iconsax.home),
          ),
          BottomNavigationBarItem(
            label: "الطلبات",
            icon: controller.currentIndex == 1
                ? SvgPicture.asset(
                    AppIconsAsset.ordersIconActive,
                  )
                : SvgPicture.asset(AppIconsAsset.orders),
          ),
          BottomNavigationBarItem(
            label: "حسابى",
            icon: controller.currentIndex == 2
                ? SvgPicture.asset(AppIconsAsset.userActive)
                : const Icon(Iconsax.user),
          ),
        ],
      ),
    );
  }
}
