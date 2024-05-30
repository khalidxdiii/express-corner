import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/alertexitapp.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../../../core/shared/defult_button.dart';
import '../../../../../core/shared/defult_dropdown_search.dart';
import '../../controllers/delivary_edit_profile_controller.dart';
import '../widgets/delivary_edit_profile_inputfield_with_title.dart';
import '../widgets/delivary_edit_profile_delivary_info.dart';

class DelivaryEditProfileView extends StatelessWidget {
  const DelivaryEditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    DelivaryEditProfileControllerImp controller =
        Get.put(DelivaryEditProfileControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "تعديل الملف الشخصى",
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                onWillPop: () {
                  return delivaryExitEditPage();
                },
                key: controller.key,
                child: GetBuilder<DelivaryEditProfileControllerImp>(
                    builder: (controller) => HandlingDataView(
                          statusRequest: controller.statusRequest!,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const DelivaryEditProfileDelivaryInfo(),
                              const SizedBox(height: 20),
                              DelivaryEditProfileInputFieldWithTitle(
                                title: "الأســم بالكامل",
                                titleText: "الأســم بالكامل",
                                hintText: "الأســم بالكامل",
                                controller: controller.username,
                                removePrefixIcon: true,
                                validator: (value) {
                                  return validinput(
                                      val: value!,
                                      min: 5,
                                      max: 50,
                                      type: "username");
                                },
                              ),
                              DelivaryEditProfileInputFieldWithTitle(
                                title: "البريد الالكتروني",
                                titleText: "البريد الالكتروني",
                                hintText: "البريد الالكتروني",
                                removePrefixIcon: true,
                                suffixIcon: Icons.edit,
                                onTapIcon: () {
                                  Get.toNamed(
                                      AppRoute.delivaryProfileEditEmail);
                                },
                                isReadOnly: true,
                                controller: controller.email,
                                validator: (value) {
                                  return validinput(
                                      val: value!,
                                      min: 5,
                                      max: 50,
                                      type: "email");
                                },
                              ),
                              // DelivaryEditProfileInputFieldWithTitle(
                              //   titleText: "كلمة المرور",
                              //   title: "كلمة المرور",
                              //   controller: controller.password,
                              //   isPassword: controller.isShowPassword,
                              //   isHideSuffixIcon: false,
                              //   iconData: Icons.visibility,
                              //   removePrefixIcon: true,
                              //   suffixIcon: controller.isShowPassword
                              //       ? Icons.visibility
                              //       : Icons.visibility_off,
                              //   onTapIcon: () {
                              //     controller.showPassword();
                              //   },
                              //   validator: (value) {
                              //     return validinput(
                              //         val: value!,
                              //         min: 8,
                              //         max: 50,
                              //         type: "password");
                              //   },
                              // ),
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
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        listdata: controller.govDropDownList,
                                        onSelected: (name, selectedValue) {
                                          controller.selectGovAndShowCity(
                                              selectedValue: selectedValue);
                                        },
                                        validator: (value) {
                                          return validinput(
                                              val: value!,
                                              min: 1,
                                              max: 50,
                                              type: "gov");
                                        },
                                        dropdownSelectedName:
                                            controller.govName,
                                        dropdownSelectedID: controller.govId),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: CustomDropDownSearch(
                                        title: "المدينة",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        listdata: controller.cityDropDownList,
                                        onSelected: (name, selectedValue) {},
                                        validator: (value) {
                                          return validinput(
                                              val: value!,
                                              min: 5,
                                              max: 30,
                                              type: "city");
                                        },
                                        dropdownSelectedName:
                                            controller.cityName,
                                        dropdownSelectedID: controller.cityId),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              DelivaryEditProfileInputFieldWithTitle(
                                titleText: "رقم الهاتف",
                                title: "رقم الهاتف",
                                hintText: "رقم الهاتف",
                                removePrefixIcon: true,
                                suffixIcon: Icons.edit,
                                onTapIcon: () {},
                                isReadOnly: true,
                                controller: controller.phone,
                                validator: (value) {
                                  return validinput(
                                      val: value!,
                                      min: 11,
                                      max: 11,
                                      type: "phone");
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomDefultButton(
                                text: "حفظ التغييرات",
                                onPressed: () {
                                  controller.edit();
                                },
                              ),
                            ],
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
