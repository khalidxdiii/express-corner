import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:express_corner/core/constant/colors.dart';

import '../../../../../../linkapi.dart';
import '../../../controllers/delivary_orders_details_controller.dart';

class DelivaryOrdersDetailsItemsCard
    extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrdersDetailsItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DelivaryOrdersDetailsPlacesCard(),
        SizedBox(height: 10),
        DelivaryOrdersDetailsItemsListCard(),
        SizedBox(height: 10),
        DelivaryOrderDetailsImageSection(),
        SizedBox(height: 10),
        DelivaryOrderDetailsUserNoteSection()
      ],
    );
  }
}

class DelivaryOrdersDetailsPlacesCard extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrdersDetailsPlacesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText("الاماكن", AppColor.primaryColor),
          ...List.generate(
            controller.orderslocationNames.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Text(
                controller.orderslocationNames[index],
                style: textStyle(Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class DelivaryOrdersDetailsItemsListCard
    extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrdersDetailsItemsListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText("الطلبات", AppColor.primaryColor),
          const SizedBox(height: 5),
          ...List.generate(
            controller.items.length,
            (index) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.only(top: index == 0 ? 0 : 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffE0F3EF),
              ),
              child: Text(
                controller.items[index],
                style: textStyle(Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DelivaryOrderDetailsUserNoteSection
    extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrderDetailsUserNoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText("الملاحظات", AppColor.primaryColor),
          const SizedBox(height: 5),
          Text(
            controller.dataOrder.ordersNotes.toString(),
            style: textStyle(Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class DelivaryOrderDetailsImageSection
    extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrderDetailsImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText("المرفقات", AppColor.primaryColor),
          const SizedBox(height: 5),
          controller.dataOrder.ordersImages != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.openImage, arguments: {
                        "imageUrl":
                            "${AppLink.imageOrder}/${controller.dataOrder.ordersImages}"
                      });
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageOrder}/${controller.dataOrder.ordersImages}",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Text(
                  "لا يوجد مرفقات",
                  style: textStyle(Colors.black, fontSize: 12),
                )
        ],
      ),
    );
  }
}

// Helper methods for custom widgets and styles
Widget customContainer({required Widget child}) {
  return Container(
    width: double.infinity,
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
      child: child,
    ),
  );
}

Text customText(String text, Color color) {
  return Text(
    text,
    style: textStyle(color),
  );
}

TextStyle textStyle(Color color, {double fontSize = 14}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    color: color,
    height: 1.5,
  );
}
