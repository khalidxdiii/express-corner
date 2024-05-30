import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constant/app_icons_assets.dart';
import '../../../controllers/orders_details_controller.dart';

class OrdersDetailsPartTwo extends GetView<OrdersDetailsController> {
  const OrdersDetailsPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customListTile(
              title: "اماكن الطلبات",
              subtitle: List.generate(
                controller.orderslocationNames.length,
                (index) => Text(
                  controller.orderslocationNames[index],
                  style: const TextStyle(fontSize: 12, height: 1.5),
                ),
              ),
              leadingIcon: AppIconsAsset.ordersDetailsLocation,
            ),
            const Divider(),
            customListTile(
              title: "توصيل إلى",
              subtitle: [
                Text(
                  controller.dataOrder.ordersAddressUserDetails.toString(),
                  style: const TextStyle(fontSize: 12),
                )
              ],
              leadingIcon: AppIconsAsset.stepDone,
              leadingWidth: 20, // Adjust this value as necessary
            ),
          ],
        ),
      ),
    );
  }

  Widget customListTile({
    required String title,
    required List<Widget> subtitle,
    required String leadingIcon,
    double leadingWidth = 24.0, // Default leading width
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(leadingIcon, width: leadingWidth),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              ...subtitle,
            ],
          ),
        ),
      ],
    );
  }
}
