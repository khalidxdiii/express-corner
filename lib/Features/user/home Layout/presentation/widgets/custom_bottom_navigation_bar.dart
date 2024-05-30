import 'package:express_corner/Features/user/home%20Layout/controllers/home_controller.dart';
import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavigationBar extends GetView<HomeControllerImp> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
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
          // BottomNavigationBarItem(
          //   label: "الرسائل",
          //   icon: controller.currentIndex == 1
          //       ? const Icon(
          //           Iconsax.message5,
          //         )
          //       : const Icon(Iconsax.message),
          // ),
          BottomNavigationBarItem(
            label: "الطلبات",
            icon: controller.currentIndex == 1
                ? SvgPicture.asset(
                    AppIconsAsset.ordersIconActive,
                  )
                : SvgPicture.asset(AppIconsAsset.orders),
          ),
          BottomNavigationBarItem(
            label: "المفضلة",
            icon: controller.currentIndex == 2
                ? const Icon(Iconsax.heart5)
                : const Icon(Iconsax.heart),
          ),
          BottomNavigationBarItem(
            label: "حسابى",
            icon: controller.currentIndex == 3
                ? SvgPicture.asset(AppIconsAsset.userActive)
                : const Icon(Iconsax.user),
          ),
        ],
      ),
    );
  }
}
