import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../../../core/shared/defult_rating_bar.dart';
import '../../../../../linkapi.dart';
import '../../controller/delivary_ratings_controller.dart';

class DelivaryRatingCard extends GetView<DelivaryRatingsControllerImp> {
  const DelivaryRatingCard(
      {super.key,
      required this.userName,
      required this.cityName,
      required this.feedBack,
      required this.userRating});
  final String userName;
  final String cityName;
  final String feedBack;
  final double userRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // const CircleAvatar(
              //   radius: 24,
              // ),
              GestureDetector(
                onTap: () {
                  if (controller.delivaryRatingsModel.first.userImage !=
                          "empty" ||
                      controller.delivaryRatingsModel.first.userImage !=
                          "fail") {
                    Get.toNamed(AppRoute.openImage, arguments: {
                      "imageUrl": "${AppLink.imageUser}/${controller.userImage}"
                    });
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (controller.userImage == "empty" ||
                          controller.userImage == "fail" ||
                          controller.userImage == "")
                      ? Image.asset(
                          AppImageAsset.user,
                          fit: BoxFit.fill,
                        )
                      : CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageUser}/${controller.userImage}",
                          placeholder: (context, url) => Lottie.asset(
                            AppImageAsset.imageLoading,
                            height: 50,
                            width: 50,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                        color: Colors.black, fontSize: 14, height: 1.1),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColor.primaryColor,
                        size: 14,
                      ),
                      Text(
                        cityName,
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 9,
                            height: 0.9),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              DefultRatingBar(
                initialRating: userRating,
                ignoreGestures: true,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                sizeIcon: 26.0,
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          Text(
            feedBack,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
