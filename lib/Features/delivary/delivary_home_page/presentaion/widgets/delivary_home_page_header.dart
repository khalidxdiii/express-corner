import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/app_icons_assets.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../../../linkapi.dart';
import '../../controllers/delivary_home_controller.dart';

class DelivaryHomePageHeader extends GetView<DelivaryHomePageControllerImp> {
  const DelivaryHomePageHeader({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF005338),
              Color(0xFF2FAB8D),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          )),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppIconsAsset.logoWithoutIcon),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          clipBehavior: Clip.antiAlias,
                          child: (controller.myServices.sharedPreferences
                                          .getString("userimage") ==
                                      "empty" ||
                                  controller.myServices.sharedPreferences
                                          .getString("userimage") ==
                                      "fail")
                              ? Image.asset(
                                  AppImageAsset.user,
                                  fit: BoxFit.fill,
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.imageUser}/${controller.myServices.sharedPreferences.getString("userimage").toString()}",
                                  placeholder: (context, url) => Lottie.asset(
                                    AppImageAsset.imageLoading,
                                    height: 70,
                                    width: 70,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "مرحبا،",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                                controller.myServices.sharedPreferences
                                    .getString("username")
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 12,
                                  // fontWeight: FontWeight.w500,
                                  // height: 1.2,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                left: 0,
                child: GestureDetector(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
