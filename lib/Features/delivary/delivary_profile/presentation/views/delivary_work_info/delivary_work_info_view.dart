import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/functions/custom_defult_dialog.dart';
import '../../../../../../core/shared/defult_custom_image_selection_widget.dart';
import '../../../../../../core/shared/defult_dropdown_menu.dart';
import '../../../controllers/delivary_work_info_profile/delivary_work_info_profile_controller.dart';

class DelivaryWorkInfoView extends StatelessWidget {
  const DelivaryWorkInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    DelivaryWorkInfoProfileControllerImp controller =
        Get.put(DelivaryWorkInfoProfileControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      //   child: CustomDefultButton(
      //     text: "حفظ",
      //     onPressed: () {
      //       controller.saveEditData();
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: GetBuilder<DelivaryWorkInfoProfileControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                LogoAuth(
                  isText: true,
                  text: "ملف الدليفرى",
                  actionText: "تعديل",
                  onTapAction: () {
                    if (controller.delivaryModel.first
                            .delivaryProfileIsWaitEditApprove !=
                        "0") {
                      controller.goToEditDelivaryWorkInfoProfile();
                    } else {
                      customDefultDialog(
                        title: "تنبية",
                        middleText:
                            "لا يمكن التعديل حتى يتم الموافقة على التعديلات التى قمت بتقديمها سابقا",
                        onConfirm: () {
                          Get.back();
                        },
                      );
                    }
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefultDropdownMenu(
                        title: "نوع المركبة :",
                        width: Get.width - 32,
                        lable: "اختر نوع المركبة",
                        controller: controller.typeVehicleController,
                        hintText: "اختر نوع المركبة",
                        isDisabled: true,
                        onSelected: (value) {
                          controller.typeVehicleOnSelected(value);
                        },
                        dropdownMenuEntries:
                            controller.typeVehicleDropdownMenuEntries,
                      ),
                      const SizedBox(height: 10),
                      DefultDropdownMenu(
                        title: "الخبرة :",
                        width: Get.width - 32,
                        lable: "الخبرة",
                        controller: controller.expertiseController,
                        hintText: "اختر عدد سنوات الخبرة",
                        isDisabled: true,
                        onSelected: (value) {
                          controller.expertiseOnSelected(value);
                        },
                        dropdownMenuEntries:
                            controller.expertiseDropdownMenuEntries,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "صورة المركبة:",
                        style: TextStyle(fontSize: 10),
                      ),
                      // DefultCustomImageSelectionWidget(
                      //   fileImage: controller.fileImageTypeVichele,
                      //   onDelete: () {
                      //     controller.deleteImageVehicle();
                      //   },
                      //   onTap: () {
                      //     controller.showOpitionImageVehicle();
                      //   },
                      // ),
                      const SizedBox(height: 10),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: controller.delivaryModel.first
                                        .delivaryProfileIsWaitEditApprove ==
                                    "0"
                                ? "${AppLink.imageDelivaryVicheles}/${controller.delivaryModel.first.delivaryProfileImageVichele}"
                                : "${AppLink.imageDelivaryVicheles}/${controller.delivaryModel.first.delivaryProfileTempImageVichele}",
                            height: 200,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "صورة البطاقه الشخصية:",
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: controller.delivaryModel.first
                                        .delivaryProfileIsWaitEditApprove ==
                                    "0"
                                ? "${AppLink.imageDelivaryIds}/${controller.delivaryModel.first.delivaryProfileImageDelivaryId}"
                                : "${AppLink.imageDelivaryIds}/${controller.delivaryModel.first.delivaryProfileTempImageDelivaryId}",
                            height: 200,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "صورة رخصه القياده :",
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: controller.delivaryModel.first
                                        .delivaryProfileIsWaitEditApprove ==
                                    "0"
                                ? "${AppLink.iamgeDelivaryDrivingLicense}/${controller.delivaryModel.first.delivaryProfileImageDrivingLicense}"
                                : "${AppLink.iamgeDelivaryDrivingLicense}/${controller.delivaryModel.first.delivaryProfileTempImageDrivingLicense}",
                            height: 200,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
