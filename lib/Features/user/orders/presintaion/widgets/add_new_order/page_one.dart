import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/functions/validinput.dart';
import '../../../../../../core/shared/defult_textformfield.dart';
import '../../../controllers/add_order_controller.dart';
import 'choose_image_section.dart';
import 'dynamic_form_places.dart';
import 'dynamic_form_details.dart';

class PageOne extends GetView<AddOrderControllerImp> {
  const PageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GetBuilder<AddOrderControllerImp>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const DynamicFormLocation(
                //   title: "اسم المكان",
                //   hintText: "مكان التوصيل رقم  ",
                // ),
                const DynamicFormPlaces(),
                const DynamicFormDetails(
                  title: "طلباتك",
                  hintText: "اسم الطلب الخاص بك رقم  ",
                  // validator: (value) {
                  //   return validinput(
                  //       val: value!, min: 5, max: 100, type: "text");
                  // },
                ),

                const AddOrderChooseImageSection(),
                const Text("الملاحظات"),
                const SizedBox(height: 5),
                CustomDefultTextForm(
                  myController: controller.notesControllers,
                  hintText: "الملاحظات",
                  lableText: "الملاحظات",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  removePrefixIcon: true,
                  maxLines: 5,
                  iconData: Icons.abc,
                  validator: (value) {
                    return validinput(
                        val: value!, min: 5, max: 100, type: "text");
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
