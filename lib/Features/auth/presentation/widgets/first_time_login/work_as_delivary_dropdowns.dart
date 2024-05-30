import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:express_corner/core/shared/defult_dropdown_menu.dart';
import '../../../controller/first_time_login/work_as_delivary_controller.dart';

class WorkAsDelivaryDropdowns extends StatelessWidget {
  final WorkAsDelivaryControllerImp controller;

  const WorkAsDelivaryDropdowns({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          dropdownMenuEntries: controller.typeVehicleDropdownMenuEntries,
        ),
        DefultDropdownMenu(
          title: "الخبرة :",
          width: Get.width - 32,
          lable: "الخبرة",
          controller: controller.expertiseController,
          hintText: "اختر عدد سنوات الخبرة",
          onSelected: (value) {
            controller.expertiseOnSelected(value);
          },
          dropdownMenuEntries: controller.expertiseDropdownMenuEntries,
        ),
      ],
    );
  }
}
