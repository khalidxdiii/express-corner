import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/imageasset.dart';
import '../../../controllers/delivary_orders_details_controller.dart';

class DelivaryOrdersDetailsPartThree
    extends GetView<DelivaryOrdersDetailsController> {
  const DelivaryOrdersDetailsPartThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffE0F3EF).withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "السعر التقريبي للمنتجات",
                        style: TextStyle(fontSize: 13),
                      ),
                      const Spacer(),
                      Text(
                        "${controller.dataOrder.ordersPrice.toString()} ج.م",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text(
                        "سعر التوصيل",
                        style: TextStyle(fontSize: 13),
                      ),
                      const Spacer(),
                      Text(
                        "${controller.dataOrder.ordersPricedelivary.toString()} ج.م",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
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
                        "${controller.dataOrder.ordersTotalprice.toString()} ج.م",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(children: [
              Image.asset(AppImageAsset.orderCash),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "نقدي",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ]),
          )
        ],
      ),
    );
  }
}
