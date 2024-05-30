import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';

class OrdersCardItem extends StatelessWidget {
  const OrdersCardItem({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "وليد طارق",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColor.primaryColor,
                              size: 15,
                            ),
                            Text(
                              "سمنود",
                              style: TextStyle(
                                fontSize: 9,
                                // fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                                height: 1.7,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("11:59 صباحاً",
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey[400],
                                height: 1.5)),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.access_time_filled,
                          color: Colors.grey[400],
                          size: 15,
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "مكان التوصيل",
                            style: TextStyle(fontSize: 9),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "المنصورة، عبد السلام عارف",
                            style: TextStyle(
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
                          Text(
                            "مكان الطلبات",
                            style: TextStyle(fontSize: 9),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "المنصورة، عبد السلام عارف",
                            style: TextStyle(
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "تكلفة الطلب",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "500",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                                color: Colors.black,
                              ),
                            ),
                            Text(
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
                    Expanded(
                      child: CustomDefultButton(
                        text: "التفاصيل",
                        isSecButton: true,
                        iscustomWidth: true,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.fithColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Center(
                    child: Text(
                      "حالة الطلب",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
