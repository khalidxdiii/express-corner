
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/data/models/place_details_model/place_details_model.dart';
import '../../../controllers/add_order_controller.dart';

class DynamicFormPlaces extends StatelessWidget {
  const DynamicFormPlaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderControllerImp>(
      builder: (controller) => Container(
        // padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("المكان"),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: AppColor.primaryColor,
                  ),
                  onPressed: () {
                    controller.addSearchField();
                  },
                ),
              ],
            ),
            Column(
                children:
                    List.generate(controller.searchControllers.length, (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: CustomDefaultTextFormField(
                            myController: controller.searchControllers[index],
                            hintText: 'ابحث باسم المكان',
                            labelText: 'ابحث باسم المكان',

                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            removePrefixIcon: true,

                            focusNode: controller
                                .focusNodes[index], // Pass the focus node here
                          ),
                        ),
                      ),
                      // if (controller.searchControllers.length >
                      //     1) // Remove button condition
                      //   IconButton(
                      //     icon: Icon(Icons.delete),
                      //     onPressed: () => controller.removeSearchField(index),
                      //   ),

                      index != 0
                          ? // Remove button condition
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  controller.removeSearchField(index),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  if (controller.placeResulte.isNotEmpty &&
                      controller.showSearchItem[index])
                    CustomSearchItem(
                      index: index,
                      onPlaceSelect: (PlaceDetailsModel placeDetails) {
                        controller.savePlaceDetails(index, placeDetails);
                      },
                    ),
                ],
              );
            })
                // ..add(
                //   ElevatedButton(
                //     onPressed: controller.addSearchField,
                //     child: const Text('Add Search Field'),
                //   ),
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchItem extends StatelessWidget {
  final int index;
  final void Function(PlaceDetailsModel) onPlaceSelect;

  const CustomSearchItem({
    super.key,
    required this.index,
    required this.onPlaceSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Use your AppColor.fithColor
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, idx) {
            return GestureDetector(
              onTap: () async {
                var placeDetails =
                    await controller.googleMapsPlacesService.getPlaceDetails(
                  placeId: controller.placeResulte[idx].placeId.toString(),
                );
                // Save the selected place details (this also updates the search text field with the place name)
                onPlaceSelect(placeDetails);
                // Clear the search results after selection
                controller.placeResulte.clear();
                controller.update();
              },
              child: ListTile(
                title: Text(controller.placeResulte[idx].description!),
              ),
            );
          },
          separatorBuilder: (context, idx) => const Divider(height: 0),
          itemCount: controller.placeResulte.length,
        ),
      ),
    );
  }
}

class CustomDefaultTextFormField extends StatelessWidget {
  final TextEditingController myController;
  final String hintText;
  final Function(String)? onChanged;
  final FocusNode focusNode;
  final String? labelText; // Optional label text
  final bool removePrefixIcon; // Whether to remove the prefix icon
  final FloatingLabelBehavior?
      floatingLabelBehavior; // Control the floating label

  const CustomDefaultTextFormField({
    Key? key,
    required this.myController,
    required this.hintText,
    this.onChanged,
    required this.focusNode,
    required this.labelText,
    required this.removePrefixIcon,
    required this.floatingLabelBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: removePrefixIcon
              ? null
              : const Icon(Icons.search), // Conditional prefix icon
          floatingLabelBehavior:
              floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        ),
        onChanged: onChanged,
        focusNode: focusNode,
      ),
    );
  }
}
