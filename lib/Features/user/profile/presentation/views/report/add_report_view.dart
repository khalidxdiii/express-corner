import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/Features/user/profile/controllers/report/add_report_controller.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/functions/validinput.dart';
import '../../../../../../core/shared/defult_button.dart';
import '../../../../../../core/shared/defult_dropdown_search.dart';
import '../../widgets/edit_profile_inputfield_with_title.dart';

class AddReportView extends StatelessWidget {
  const AddReportView({super.key});

  @override
  Widget build(BuildContext context) {
    DelivaryAddReportController controller =
        Get.put(DelivaryAddReportController());
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.key,
          child: ListView(
            children: [
              const LogoAuth(
                isText: true,
                text: "تقديم شكوى او مشكلة",
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: GetBuilder<DelivaryAddReportController>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest!,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditProfileInputFieldWithTitle(
                          title: "الأســم بالكامل",
                          titleText: "الأســم بالكامل",
                          hintText: "الأســم بالكامل",
                          controller: controller.username,
                          removePrefixIcon: true,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 50, type: "username");
                          },
                        ),
                        EditProfileInputFieldWithTitle(
                          title: "البريد الالكتروني :",
                          titleText: "البريد الالكتروني :",
                          hintText: "البريد الالكتروني :",
                          controller: controller.email,
                          removePrefixIcon: true,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 50, type: "email");
                          },
                        ),
                        const Text(
                          "العنوان",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomDropDownSearch(
                                  title: "المحافظة",
                                  listdata: controller.govDropDownList,
                                  validator: (value) {
                                    return validinput(
                                        val: value!,
                                        min: 1,
                                        max: 50,
                                        type: "gov");
                                  },
                                  onSelected: (name, selectedValue) {
                                    controller.selectGovAndShowCity(
                                        selectedValue: selectedValue);
                                  },
                                  dropdownSelectedName: controller.govName,
                                  dropdownSelectedID: controller.govId),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CustomDropDownSearch(
                                  title: "المدينة",
                                  disabled: controller.isDisabledCity,
                                  listdata: controller.cityDropDownList,
                                  onSelected: (name, selectedValue) {
                                    // controller.cityDropDownList.clear();
                                  },
                                  validator: (value) {
                                    return validinput(
                                        val: value!,
                                        min: 5,
                                        max: 30,
                                        type: "city");
                                  },
                                  dropdownSelectedName: controller.cityName,
                                  dropdownSelectedID: controller.cityId),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        EditProfileInputFieldWithTitle(
                          titleText: "رقم الهاتف",
                          title: "رقم الهاتف",
                          hintText: "رقم الهاتف",
                          removePrefixIcon: true,
                          controller: controller.phone,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 11, max: 11, type: "phone");
                          },
                        ),
                        EditProfileInputFieldWithTitle(
                          title: "الموضوع:",
                          titleText: "اكتب هنا",
                          hintText: "اكتب هنا",
                          controller: controller.subject,
                          maxLines: 5,
                          removePrefixIcon: true,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 10, max: 300, type: "text");
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomDefultButton(
                          text: "حفظ العنوان",
                          onPressed: () {
                            controller.sendReport();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
