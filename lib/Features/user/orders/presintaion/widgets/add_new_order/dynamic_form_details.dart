// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../../core/shared/defult_textformfield.dart';
// import '../../../controllers/add_order_controller.dart';

// class DynamicFormDetails extends GetView<AddOrderControllerImp> {
//   const DynamicFormDetails({
//     super.key,
//     required this.title,
//     required this.hintText,
//     // required this.validator,
//   });

//   final String title;
//   final String hintText;
//   // final String Function(String?) validator;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(title),
//             const Spacer(),
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 controller.adddetailsTextFormField();
//               },
//             ),
//           ],
//         ),
//         Obx(
//           () => ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: controller.detailsControllers.length,
//             itemBuilder: (_, index) {
//               return Row(
//                 children: [
//                   Expanded(
//                     child: CustomDefultTextForm(
//                       myController: controller.detailsControllers[index],
//                       hintText: "$hintText${index + 1}",
//                       lableText: "$hintText${index + 1}",
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       removePrefixIcon: true,
//                       iconData: Icons.abc,
//                       // validator: validator,
//                       disableValidator: true,
//                     ),
//                   ),
//                   index != 0
//                       ? IconButton(
//                           onPressed: () {
//                             controller.removeDetailsTextFormField(index);
//                           },
//                           icon: const Icon(Icons.delete))
//                       : const SizedBox(),
//                 ],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/shared/defult_textformfield.dart';
import '../../../controllers/add_order_controller.dart';

class DynamicFormDetails extends GetView<AddOrderControllerImp> {
  const DynamicFormDetails({
    super.key,
    required this.title,
    required this.hintText,
  });

  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: AppColor.primaryColor,
              ),
              onPressed: () {
                controller.adddetailsTextFormField();
              },
            ),
          ],
        ),
        GetBuilder<AddOrderControllerImp>(
          builder: (controller) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.detailsControllers.length,
            itemBuilder: (_, index) {
              return Row(
                children: [
                  // Dropdown button for selecting the place
                  // DropdownButton<int>(
                  //   value: controller.selectedPlaceNums.isNotEmpty &&
                  //           controller.selectedPlaceNums.length > index
                  //       ? controller.selectedPlaceNums[index]
                  //       : null, // Ensure the value exists in the items or is null.
                  //   items: List.generate(
                  //           controller.locationControllers.length, (i) => i + 1)
                  //       .map<DropdownMenuItem<int>>((int value) {
                  //     return DropdownMenuItem<int>(
                  //       value: value,
                  //       child: Text(value.toString()),
                  //     );
                  //   }).toList(),
                  //   onChanged: (int? newValue) {
                  //     if (newValue != null) {
                  //       controller.setSelectedPlaceNum(index,
                  //           newValue); // Ensure newValue is not null before setting
                  //     }
                  //   },
                  //   // isExpanded: true, // Optional, for UI consistency
                  // ),
                  // SizedBox(width: 5),
                  Expanded(
                    child: CustomDefultTextForm(
                      myController: controller.detailsControllers[index],
                      hintText: "$hintText${index + 1}",
                      lableText: "$hintText${index + 1}",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      removePrefixIcon: true,
                      iconData: Icons.abc,
                      disableValidator: true,
                    ),
                  ),

                  index != 0
                      ? IconButton(
                          onPressed: () {
                            controller.removeDetailsTextFormField(index);
                          },
                          icon: const Icon(Icons.delete))
                      : const SizedBox(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
