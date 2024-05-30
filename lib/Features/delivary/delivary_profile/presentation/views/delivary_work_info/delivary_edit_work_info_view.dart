import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/shared/defult_custom_image_selection_widget.dart';
import '../../../../../../core/shared/defult_dropdown_menu.dart';
import '../../../controllers/delivary_work_info_profile/delivary_edit_work_info_profile_controller.dart';

class DelivaryEditWorkInfoView extends StatelessWidget {
  const DelivaryEditWorkInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    DelivaryEditWorkInfoProfileControllerImp controller =
        Get.put(DelivaryEditWorkInfoProfileControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: CustomDefultButton(
          text: "حفظ",
          onPressed: () {
            controller.saveEditData();
          },
        ),
      ),
      body: SafeArea(
        child: GetBuilder<DelivaryEditWorkInfoProfileControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const LogoAuth(
                  isText: true,
                  text: "تعديل ملف الدليفرى",
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
                      DefultCustomImageSelectionWidget(
                        fileImage: controller.fileImageTypeVichele,
                        onDelete: () {
                          controller.deleteImageVehicle();
                        },
                        onTap: () {
                          controller.showOpitionImageVehicle();
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "صورة البطاقه الشخصية:",
                        style: TextStyle(fontSize: 10),
                      ),
                      DefultCustomImageSelectionWidget(
                        fileImage: controller.fileImageDelivaryId,
                        onDelete: () {
                          controller.deleteImageDelivaryId();
                        },
                        onTap: () {
                          controller.showOpitionImageDelivaryId();
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "صورة رخصه القياده :",
                        style: TextStyle(fontSize: 10),
                      ),
                      DefultCustomImageSelectionWidget(
                        fileImage: controller.fileImageDrivingLicense,
                        onDelete: () {
                          controller.deleteImageDrivingLicense();
                        },
                        onTap: () {
                          controller.showOpitionImageDrivingLicense();
                        },
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
