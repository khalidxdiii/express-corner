import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../controllers/orders_controller.dart';

class PindingCardItem extends GetView<OrdersControllerImp> {
  const PindingCardItem({
    super.key,
    required this.orderId,
    required this.startLocation,
    required this.endLocation,
    required this.totalPrice,
    required this.time,
    required this.onDetails,
    required this.onDelete,
  });

  final String orderId;
  final String startLocation;
  final String endLocation;
  final String totalPrice;
  final String time;
  final void Function() onDetails;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    Jiffy.setLocale("ar");
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "رقم الطلب : ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      orderId,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Text(Jiffy.parse(time).fromNow(),
                        // time,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[400],
                          // height: 1.5,
                        )),
                  
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "مكان التوصيل",
                            style: TextStyle(fontSize: 9),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            startLocation,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "مكان الطلبات",
                            style: TextStyle(fontSize: 9),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            endLocation,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "تكلفة الطلب",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              totalPrice,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "  جنية",
                              style: TextStyle(
                                fontSize: 10,
                                height: 1.7,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 30),
                    // Expanded(
                    //   child: CustomDefultButton(
                    //     text: "التفاصيل",
                    //     isSecButton: true,
                    //     iscustomWidth: true,
                    //     padding: const EdgeInsets.symmetric(vertical: 14),
                    //     onPressed: onDetails,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomDefultButton(
                        text: "التفاصيل",
                        // isSecButton: true,

                        iscustomWidth: true,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        onPressed: onDetails,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffFF0000).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Center(
                            child: Text(
                              "حذف الطلب",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
