import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/delivary_orders_details_controller.dart';
import 'delivary_orders_details_items_card.dart';
import 'delivary_order_details_user_card_info.dart';
import 'delivary_orders_details_rating_card_item.dart';

class DelivaryOrdersDetailsPartOne
    extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrdersDetailsPartOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "رقم الطلب : ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              controller.dataOrder.ordersId.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        controller.status == "pinding"
            ? const SizedBox(height: 5)
            : const SizedBox(),
        controller.status == "pinding"
            ? const DelivaryOrderDetailsUserCardInfo()
            : const SizedBox(),
        const SizedBox(height: 10),
        const DelivaryOrdersDetailsItemsCard(),
        const SizedBox(height: 10),
        controller.status == "archive"
            ? const DelivaryOrdersDetailsRatingCardItem()
            : const SizedBox(),
      ],
    );
  }
}
