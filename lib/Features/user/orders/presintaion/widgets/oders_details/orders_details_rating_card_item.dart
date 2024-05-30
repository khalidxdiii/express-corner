import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/approutes.dart';
import '../../../../../../core/shared/defult_rating_bar.dart';
import '../../../controllers/orders_details_controller.dart';
import 'orders_details_items_card.dart';

class OrdersDetailsRatingCardItem extends GetView<OrdersDetailsController> {
  const OrdersDetailsRatingCardItem({super.key});

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
          controller.dataOrder.userIsRating == "1"
              ? const SizedBox(height: 5)
              : const SizedBox(height: 0),
          controller.dataOrder.userIsRating == "1"
              ? DefultRatingBar(
                  initialRating:
                      double.parse(controller.dataOrder.userRating.toString()),
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {},
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "لم تقم بتقييم الطلب حتى الان",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoute.userRatingView,
                          arguments: {
                            "orderId": controller.dataOrder.ordersId.toString(),
                            "delivaryid": controller.dataOrder.ordersDelivaery
                          },
                        );
                      },
                      child: const Text(
                        "اضغط هنا للتقيم !!",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
