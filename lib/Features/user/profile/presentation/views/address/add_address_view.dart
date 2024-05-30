import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/functions/validinput.dart';
import '../../../../../../core/shared/defult_dropdown_search.dart';

import '../../../controllers/address/add_controller.dart';
import '../../widgets/edit_profile_inputfield_with_title.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddAdressController controller = Get.put(AddAdressController());
    return Scaffold(
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(right: 16, left: 16, bottom: 25, top: 10),
        child: CustomDefultButton(
          text: "حفظ العنوان",
          onPressed: () {
            controller.add();
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "عنوان جديد",
            ),
            GetBuilder<AddAdressController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Form(
                  key: controller.key,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "المحافظة",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomDropDownSearch(
                            title: "المحافظة",
                            listdata: controller.govDropDownList,
                            validator: (value) {
                              return validinput(
                                  val: value!, min: 1, max: 50, type: "gov");
                            },
                            onSelected: (name, selectedValue) {
                              controller.selectGovAndShowCity(
                                  selectedValue: selectedValue);
                            },
                            dropdownSelectedName: controller.govName,
                            dropdownSelectedID: controller.govId),
                        const SizedBox(height: 10),
                        const Text(
                          "اخنر مدينتك:",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomDropDownSearch(
                            title: "المدينة",
                            disabled: controller.isDisabledCity,
                            listdata: controller.cityDropDownList,
                            onSelected: (name, selectedValue) {
                              controller.cityDropDownList.clear();
                            },
                            validator: (value) {
                              return validinput(
                                  val: value!, min: 5, max: 30, type: "city");
                            },
                            dropdownSelectedName: controller.cityName,
                            dropdownSelectedID: controller.cityId),
                        const SizedBox(height: 10),
                        EditProfileInputFieldWithTitle(
                          title: "عنوان تفصيلى:",
                          titleText: "اكتب هنا",
                          hintText: "اكتب هنا",
                          maxLines: 5,
                          controller: controller.addressDetails,
                          removePrefixIcon: true,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 50, type: "text");
                          },
                        ),
                        EditProfileInputFieldWithTitle(
                          title: "نوع العنوان:",
                          titleText: "مثال ( البيت - العمل )",
                          hintText: "مثال ( البيت - العمل )",
                          controller: controller.addressType,
                          removePrefixIcon: true,
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 50, type: "text");
                          },
                        ),
                        const SizedBox(height: 50),
                        // CustomDefultButton(
                        //   text: "حفظ العنوان",
                        //   onPressed: () {
                        //     controller.add();
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
