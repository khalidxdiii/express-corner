// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../../core/shared/defult_textformfield.dart';
// import '../../../controllers/add_order_controller.dart';

// class DynamicFormLocation extends GetView<AddOrderControllerImp> {
//   const DynamicFormLocation({
//     super.key,
//     required this.title,
//     required this.hintText,
//   });

//   final String title;
//   final String hintText;

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
//                 controller.addLocationTextFormField();
//                 controller.update();
//               },
//             ),
//           ],
//         ),
//         Obx(
//           () => ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: controller.locationControllers.length,
//             itemBuilder: (_, index) {
//               int placeNum = index + 1;
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                       ),
//                       padding: const EdgeInsets.all(16),
//                       child: Text(
//                         placeNum.toString(),
//                         style: const TextStyle(
//                             height: 1.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14),
//                       )),
//                   const SizedBox(width: 5),
//                   Expanded(
//                     child: CustomDefultTextForm(
//                       myController: controller.locationControllers[index],
//                       hintText: "$hintText${index + 1}",
//                       lableText: "$hintText${index + 1}",
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       removePrefixIcon: true,
//                       iconData: Icons.abc,
//                       disableValidator: true,
//                     ),
//                   ),
//                   index != 0
//                       ? IconButton(
//                           onPressed: () {
//                             controller.removeLocationTextFormField(index);
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

import '../../../controllers/add_order_controller.dart';

class DynamicFormLocation extends GetView<AddOrderControllerImp> {
  const DynamicFormLocation({
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
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.addLocationTextFormField();
              },
            ),
          ],
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.locationControllers.length,
            itemBuilder: (_, index) {
              int placeNum = index + 1;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        placeNum.toString(),
                        style: const TextStyle(
                            height: 1.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.locationControllers[index],
                          decoration: InputDecoration(
                            hintText: "$hintText $placeNum",
                            // Add more decoration as per your UI design
                          ),
                          onChanged: (value) =>
                              controller.fetchPlaceSuggestions(value),
                        ),
                        Obx(() => ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.placeSuggestions.length,
                              itemBuilder: (_, suggestionIndex) => ListTile(
                                title: Text(controller
                                    .placeSuggestions[suggestionIndex]),
                                onTap: () {
                                  // Handle the suggestion selection
                                  // For example, fill the text field with the selected suggestion
                                  controller.locationControllers[index].text =
                                      controller
                                          .placeSuggestions[suggestionIndex];
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                  index != 0
                      ? IconButton(
                          onPressed: () {
                            controller.removeLocationTextFormField(index);
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
