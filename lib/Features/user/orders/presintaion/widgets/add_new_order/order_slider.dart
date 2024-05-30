import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/app_icons_assets.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../controllers/add_order_controller.dart';

class CustomSliderControllerAddOrder extends StatelessWidget {
  const CustomSliderControllerAddOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderControllerImp>(
      builder: (controller) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(
          children: [
            OrderSliderItem(currentPage: 0),
            OrderSliderItem(currentPage: 1),
            OrderSliderItem(currentPage: 2, showLine: false),
          ],
        ),
      ),
    );
  }
}

class OrderSliderItem extends StatelessWidget {
  const OrderSliderItem({
    super.key,
    required this.currentPage,
    this.showLine = true,
  });

  final int currentPage;
  final bool? showLine;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderControllerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              (controller.currentPage == currentPage)
                  ? SvgPicture.asset(AppIconsAsset.stepCrrunet)
                  : controller.currentPage < currentPage
                      ? SvgPicture.asset(AppIconsAsset.stepPending)
                      : SvgPicture.asset(AppIconsAsset.stepDone),
              showLine == true
                  ? Container(
                      width: Get.width / 3,
                      // width: 50,
                      height: 2,
                      color: controller.currentPage < currentPage
                          ? AppColor.gray
                          : AppColor.primaryColor,
                    )
                  : const SizedBox(),
            ],
          ),
          Text(
            controller.pagesName[currentPage],
            style: TextStyle(
                color: controller.currentPage < currentPage
                    ? AppColor.gray
                    : AppColor.primaryColor),
          ),
        ],
      ),
    );
  }
}
