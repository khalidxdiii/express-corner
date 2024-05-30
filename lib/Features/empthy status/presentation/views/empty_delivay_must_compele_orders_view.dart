import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/empty_status_controller.dart';

class EmptyDelivaryMustCompleteOrdersView extends StatelessWidget {
  const EmptyDelivaryMustCompleteOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmptyStatusControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height / 10,
          ),
          SvgPicture.asset(AppIconsAsset.emptyOrders),
          const SizedBox(height: 20),
          const Text(
            'تنبية',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          ),
          const SizedBox(height: 15),
          const Text(
            "يجب توصيل جميع طلباتك اولا وانهائها حتى تستطيع ان تقبل طلبات جديده مرة اخرى!",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
