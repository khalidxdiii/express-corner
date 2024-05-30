import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/orders_details_controller.dart';
import 'orders_details_items_card.dart';
import 'order_details_delivary_card_info.dart';
import 'orders_details_rating_card_item.dart';

class OrdersDetailsPartOne extends GetView<OrdersDetailsController> {
  const OrdersDetailsPartOne({super.key});

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
        controller.status != "pinding"
            ? const SizedBox(height: 5)
            : const SizedBox(),
        controller.status != "pinding"
            ? const OrderDetailsDelivaryCardInfo()
            : const SizedBox(),
        const SizedBox(height: 10),
        const OrdersDetailsItemsCard(),
        const SizedBox(height: 10),
        controller.status == "archive"
            ? const OrdersDetailsRatingCardItem()
            : const SizedBox(),
      ],
    );
  }
}
