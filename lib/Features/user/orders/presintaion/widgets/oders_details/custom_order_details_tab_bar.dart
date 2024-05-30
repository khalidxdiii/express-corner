import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constant/colors.dart';
import '../../../controllers/orders_details_controller.dart';

class CustomOrderDetailsTabBar extends GetView<OrdersDetailsController> {
  const CustomOrderDetailsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersDetailsController>(
      builder: (controller) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: Get.width,
            height: 1,
            color: Colors.grey[300],
          ),
          Row(
            children: [
              ...List.generate(
                controller.pages.length,
                (index) => Expanded(
                  child: SizedBox(
                    height: 30,
                    width: Get.width / controller.pages.length,
                    child: GestureDetector(
                      onTap: () {
                        controller.changePage(index);
                      },
                      child: SizedBox(
                        height: 30,
                        width: Get.width / controller.pages.length,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.currentPage == index
                                    ? SvgPicture.asset(
                                        controller.pages.toList()[index]
                                            ["iconActive"] as String)
                                    : SvgPicture.asset(controller.pages
                                        .toList()[index]["icon"] as String),
                                const SizedBox(width: 5),
                                Text(
                                  controller.pages
                                      .toList()[index]["title"]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: controller.currentPage == index
                                          ? 14
                                          : 12,
                                      color: controller.currentPage == index
                                          ? Colors.black
                                          : Colors.grey[500],
                                      fontWeight:
                                          controller.currentPage == index
                                              ? FontWeight.bold
                                              : null,
                                      height: 1.1),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 1,
                              color: controller.currentPage == index
                                  ? AppColor.primaryColor
                                  : null,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
