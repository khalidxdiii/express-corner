import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/shared/defult_rating_bar.dart';
import '../../../controllers/delivary_orders_details_controller.dart';
import 'delivary_orders_details_items_card.dart';

class DelivaryOrdersDetailsRatingCardItem
    extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrdersDetailsRatingCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return customContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "التقييم",
          style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        DefultRatingBar(
          initialRating:
              double.parse(controller.dataOrder.userRating.toString()),
          ignoreGestures: true,
          onRatingUpdate: (rating) {},
        ),
      ],
    ));
  }
}
