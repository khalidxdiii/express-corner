import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../core/constant/imageasset.dart';
import '../../../../../../../linkapi.dart';
import '../../../../controllers/delivary_orders_controller.dart';

class DelivaryPindingCardItem extends GetView<DelivaryOrdersControllerImp> {
  const DelivaryPindingCardItem({
    super.key,
    required this.orderId,
    required this.startLocation,
    required this.endLocation,
    required this.totalPrice,
    required this.time,
    required this.onDetails,
    required this.onRefuse,
    required this.onApprove,
    required this.index,
    required this.userName,
    required this.userLocation,
    required this.userImageUrl,
  });

  final String orderId;
  final String startLocation;
  final String endLocation;
  final String totalPrice;
  final String time;
  final void Function() onDetails;
  final void Function() onRefuse;
  final void Function() onApprove;
  final int index;
  final String userName;
  final String userLocation;
  final String userImageUrl;

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
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey[200],
                      child: GestureDetector(
                        onTap: () {
                          if (controller.pindingDataOrders[index].userImage !=
                                  "empty" ||
                              controller.pindingDataOrders[index].userImage !=
                                  "fail") {
                            Get.toNamed(AppRoute.openImage, arguments: {
                              "imageUrl": "${AppLink.imageUser}/$userImageUrl"
                            });
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: (controller
                                          .pindingDataOrders[index].userImage ==
                                      "empty" ||
                                  controller
                                          .pindingDataOrders[index].userImage ==
                                      "fail")
                              ? Image.asset(
                                  AppImageAsset.user,
                                  fit: BoxFit.fill,
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.imageUser}/$userImageUrl",
                                  placeholder: (context, url) => Lottie.asset(
                                    AppImageAsset.imageLoading,
                                    height: 60,
                                    width: 60,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColor.primaryColor,
                              size: 15,
                            ),
                            Text(
                              userLocation,
                              style: const TextStyle(
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
                    Text(
                      Jiffy.parse(time).fromNow(),
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey[400],
                        height: 2.7,
                        // textBaseline: TextBaseline.ideographic,
                      ),
                    ),
                  ],
                ),
                const Divider(),
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
                    const SizedBox(width: 45),
                    Expanded(
                      child: CustomDefultButton(
                        text: "التفاصيل",
                        isSecButton: true,
                        iscustomWidth: true,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        onPressed: onDetails,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onRefuse,
                        child: Container(
                          decoration: BoxDecoration(
                            // color: const Color(0xffFF0000).withOpacity(0.4),
                            color: AppColor.fithColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Center(
                            child: Text(
                              "رفض",
                              style: TextStyle(
                                // color: Colors.white,
                                color: AppColor.primaryColor,
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
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: CustomDefultButton(
                        text: "قبول",
                        iscustomWidth: true,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        onPressed: onApprove,
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
