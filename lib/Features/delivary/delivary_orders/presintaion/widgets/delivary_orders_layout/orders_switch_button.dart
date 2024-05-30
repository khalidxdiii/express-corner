import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/delivary_orders_controller.dart';

class OrdersSwitchButton extends GetView<DelivaryOrdersControllerImp> {
  const OrdersSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DelivaryOrdersControllerImp>(
      builder: (controller) => Container(
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(35),
          ),
          height: 44,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.choosePage(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.currentPage == 0
                          ? AppColor.primaryColor
                          : const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Center(
                      child: Text(
                        "المعلقة",
                        style: TextStyle(
                          color:
                              controller.currentPage == 0 ? Colors.white : null,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.choosePage(1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.currentPage == 1
                          ? AppColor.primaryColor
                          : const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Center(
                      child: Text(
                        "طلباتك",
                        style: TextStyle(
                          color:
                              controller.currentPage == 1 ? Colors.white : null,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.choosePage(2);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.currentPage == 2
                          ? AppColor.primaryColor
                          : const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Center(
                      child: Text(
                        "السابقة",
                        style: TextStyle(
                          color:
                              controller.currentPage == 2 ? Colors.white : null,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
