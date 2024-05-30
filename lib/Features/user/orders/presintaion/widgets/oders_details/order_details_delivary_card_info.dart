import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/imageasset.dart';
import '../../../../../../../linkapi.dart';
import '../../../../../../core/constant/approutes.dart';
import '../../../controllers/orders_details_controller.dart';

class OrderDetailsDelivaryCardInfo extends GetView<OrdersDetailsController> {
  const OrderDetailsDelivaryCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
          color: AppColor.primaryColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const Placeholder(fallbackHeight: 80, fallbackWidth: 80),
            GestureDetector(
              onTap: () {
                if (controller.dataOrder.deliveryImage != "empty" ||
                    controller.dataOrder.deliveryImage != "fail") {
                  Get.toNamed(AppRoute.openImage, arguments: {
                    "imageUrl":
                        "${AppLink.imageUser}/${controller.dataOrder.deliveryImage.toString()}"
                  });
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: (controller.dataOrder.deliveryImage != "empty" ||
                          controller.dataOrder.deliveryImage != "fail")
                      ? CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageUser}/${controller.dataOrder.deliveryImage.toString()}",
                          fit: BoxFit.cover,
                        )
                      : Image.asset(AppImageAsset.user),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  controller.dataOrder.deliveryName.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                // const SizedBox(height: 2),
                Text(
                  "نوع المركبة: ${controller.dataOrder.deliveryTypeVehicle.toString()}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(children: [
                    Icon(
                      Icons.star_border,
                      color: AppColor.primaryColor,
                    ),
                    Text(
                      "3 سنوات خبرة",
                      style: TextStyle(
                          fontSize: 12, color: Colors.black, height: 1.5),
                    )
                  ]),
                ),
              ],
            )
          ]),
    );
  }
}
