import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/Features/user/profile/data/models/users_model.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../linkapi.dart';
import '../../controllers/profile_controller.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    this.isEdit = false,
    this.image = "",
  });
  final bool? isEdit;
  final String? image;

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return GetBuilder<ProfileControllerImp>(
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.editProfile,
                        arguments: {"usermodel": controller.userModel});
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
              Text(
                '${controller.govName ?? ""} - ${controller.cityName ?? ""}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
