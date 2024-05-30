import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../core/constant/app_icons_assets.dart';
import '../../../../../../../core/constant/approutes.dart';
import '../../../../../../../core/constant/imageasset.dart';
import '../../../../../../../core/shared/defult_rating_bar.dart';
import '../../../../../../../linkapi.dart';
import '../../../../controllers/delivary_orders_controller.dart';

class DelivaryArchiveCardItem extends GetView<DelivaryOrdersControllerImp> {
  const DelivaryArchiveCardItem({
    super.key,
    required this.orderId,
    required this.delivaryName,
    required this.delivaryLocation,
    required this.startLocation,
    required this.endLocation,
    // required this.totalPrice,
    required this.time,
    // required this.onDetails,
    required this.onStatus,
    required this.userImageUrl,
    required this.index,
  });

  final String orderId;
  final String delivaryName;
  final String delivaryLocation;
  final String startLocation;
  final String endLocation;
  // final String totalPrice;
  final String time;
  final String userImageUrl;
  // final void Function() onDetails;
  final void Function() onStatus;
  final int index;

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
                          if (controller.archiveDataOrders[index].userImage !=
                                  "empty" ||
                              controller.archiveDataOrders[index].userImage !=
                                  "fail") {
                            Get.toNamed(AppRoute.openImage, arguments: {
                              "imageUrl": "${AppLink.imageUser}/$userImageUrl"
                            });
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: (controller
                                          .archiveDataOrders[index].userImage ==
                                      "empty" ||
                                  controller
                                          .archiveDataOrders[index].userImage ==
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
                          delivaryName,
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
                              delivaryLocation,
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
                        height: 1.5,
                        // textBaseline: TextBaseline.ideographic,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.access_time_filled,
                      color: Colors.grey[400],
                      size: 15,
                    ),
                  ],
                ),
                const Divider(),
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
                  ],
                ),
                ListTile(
                  minLeadingWidth: 5,
                  horizontalTitleGap: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  dense: true,
                  title: const Text(
                    "توصيل إلى",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    startLocation,
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  leading:
                      SvgPicture.asset(AppIconsAsset.ordersDetailsLocation),
                ),
                ListTile(
                  minLeadingWidth: 5,
                  horizontalTitleGap: 8,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  dense: true,
                  title: const Text(
                    "مكان الطلبات",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    endLocation,
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  leading: SvgPicture.asset(
                    AppIconsAsset.stepDone,
                    width: 20,
                  ),
                ),
                DefultRatingBar(
                  initialRating: double.parse(controller
                      .archiveDataOrders[index].userRating
                      .toString()),
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {},
                ),
                const Divider(),
                GestureDetector(
                  onTap: onStatus,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.fithColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(
                      child: Text(
                        "تم التسليم",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
