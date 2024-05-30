import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../linkapi.dart';
import '../../controllers/delivary_profile_controller.dart';

class DelivaryInfo extends StatelessWidget {
  const DelivaryInfo({
    super.key,
    this.isEdit = false,
    this.image = "",
    required this.delivaryStatus,
  });
  final bool? isEdit;
  final String? image;
  final String delivaryStatus;

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryProfileControllerImp());
    return GetBuilder<DelivaryProfileControllerImp>(
      builder: (controller) => Row(
        children: [
          SizedBox(
            // color: Colors.black,
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (controller.image == "empty" ||
                          controller.image == "fail" ||
                          controller.image == "")
                      ? Image.asset(
                          AppImageAsset.user,
                          fit: BoxFit.fill,
                        )
                      : CachedNetworkImage(
                          imageUrl: "${AppLink.imageUser}/${controller.image}",
                          placeholder: (context, url) => Lottie.asset(
                            AppImageAsset.imageLoading,
                            height: 70,
                            width: 70,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.delivaryEditProfile, arguments: {
                      "delivaryModel": controller.delivaryInfoData
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: isEdit == true
                        ? const Icon(
                            Icons.camera_enhance,
                            color: AppColor.primaryColor,
                            size: 20,
                          )
                        : const Icon(
                            Icons.edit,
                            color: AppColor.primaryColor,
                            size: 20,
                          ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.username ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    "• ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: delivaryStatus == "available"
                          ? AppColor.primaryColor
                          : delivaryStatus == "busy"
                              ? Colors.orange
                              : Colors.red[500],
                      height: 0.8,
                    ),
                  ),
                  delivaryStatus == "available"
                      ? const Text(
                          "متاح للتوصيل",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                            height: 1.1,
                          ),
                        )
                      : delivaryStatus == "busy"
                          ? const Text(
                              "مشغول",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                height: 1.1,
                              ),
                            )
                          : Text(
                              "غير متاح للتوصيل",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[500],
                                height: 1.1,
                              ),
                            ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.delivaryRatingsView, arguments: {
                    "averageRating":
                        controller.delivaryInfoData.first.averageRating,
                    "totalRatings":
                        controller.delivaryInfoData.first.totalRatings,
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      controller.delivaryInfoData.first.averageRating
                          .toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        height: 1.3,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
