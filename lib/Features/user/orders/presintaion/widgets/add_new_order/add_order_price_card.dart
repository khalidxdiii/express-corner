import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../controllers/add_order_controller.dart';

class AddOrderPriceCard extends GetView<AddOrderControllerImp> {
  const AddOrderPriceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderControllerImp>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColor.fithColor),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Row(
            children: [
              const Text(
                "سعر التوصيل",
                style: TextStyle(fontSize: 13),
              ),
              const Spacer(),
              Text(
                "${controller.totalCost.toString()} ج.م",
                style:
                    const TextStyle(fontSize: 13, color: AppColor.primaryColor),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                "السعر بالكامل",
                style: TextStyle(fontSize: 13),
              ),
              const Spacer(),
              Text(
                "${controller.totalPriceWithShipping} ج.م",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
