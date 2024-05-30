import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../../../linkapi.dart';
import '../../controllers/delivary_edit_profile_controller.dart';

class DelivaryEditProfileDelivaryInfo
    extends GetView<DelivaryEditProfileControllerImp> {
  const DelivaryEditProfileDelivaryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(EditProfileControllerImp());
    return GetBuilder<DelivaryEditProfileControllerImp>(
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
                  child: controller.file != null
                      ? Image.file(
                          controller.file!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      // : controller.userModel?.usersImage == "empty"
                      : (controller.delivaryDataInfo?.usersImage == "empty" ||
                              controller.delivaryDataInfo?.usersImage == "fail")
                          ? Image.asset(
                              AppImageAsset.user,
                              fit: BoxFit.fill,
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  // "${AppLink.imageUser}/${controller.userModel!.usersImage}",
                                  "${AppLink.imageUser}/${controller.image}",
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
                    controller.showOpitionImage();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Icon(
                      Icons.camera_enhance,
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
                controller.myServices.sharedPreferences.getString("username") ??
                    "",
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
                      color: controller.delivaryDataInfo?.delivaryStatus ==
                              "available"
                          ? AppColor.primaryColor
                          : controller.delivaryDataInfo?.delivaryStatus ==
                                  "busy"
                              ? Colors.orange
                              : Colors.red[500],
                      height: 0.8,
                    ),
                  ),
                  controller.delivaryDataInfo?.delivaryStatus == "available"
                      ? const Text(
                          "متاح للتوصيل",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                            height: 1.1,
                          ),
                        )
                      : controller.delivaryDataInfo?.delivaryStatus == "busy"
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
            ],
          )
        ],
      ),
    );
  }
}
