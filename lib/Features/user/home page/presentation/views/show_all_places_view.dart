import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/data/models/place_details_model/place_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../../../core/shared/defult_textformfield.dart';
import '../../controllers/show_all_places_controller.dart';
import '../widgets/show_all_places/show_all_places_view_listview_widget.dart';

class ShowAllPlacesView extends StatelessWidget {
  const ShowAllPlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    ShowAllPlacesControllerImp controller =
        Get.put(ShowAllPlacesControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            LogoAuth(
              isText: true,
              text: controller.pageTitle,
            ),
            GetBuilder<ShowAllPlacesControllerImp>(
              builder: (controller) => Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomDefultTextForm(
                        myController: controller.searchController,
                        hintText: controller.searchHint,
                        lableText: controller.searchHint,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        removePrefixIcon: true,
                        suffixIcon: Icons.search,
                        iconData: Icons.abc,
                        validator: (value) {
                          return validinput(
                              val: value!, min: 5, max: 50, type: "text");
                        },
                      ),
                    ),
                    controller.searchController.text != ""
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CustomSearchItem(
                              onPlaceSelect: (placeDetailsModel) {
                                controller.searchController.clear();
                                controller.placeResulte.clear();
                                controller.sesstionToken = null;
                                controller.update();
                              },
                            ),
                          )
                        : Container(),
                    controller.searchController.text == ""
                        ? ShowAllPlacesListViewWidget(
                            pharmaciesPlacesList:
                                controller.pharmaciesPlacesList,
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSearchItem extends GetView<ShowAllPlacesControllerImp> {
  const CustomSearchItem({
    super.key,
    required this.onPlaceSelect,
  });
  final void Function(PlaceDetailsModel) onPlaceSelect;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowAllPlacesControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.fithColor),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  var placeDetails = await controller.googleMapsPlacesService
                      .getPlaceDetails(
                          placeId: controller.placeResulte[index].placeId
                              .toString());
                  onPlaceSelect(placeDetails);
                  Get.toNamed(AppRoute.addOrder,
                      arguments: {"palcemodel": placeDetails});
                },
                child: ListTile(
                  title: Text(controller.placeResulte[index].description!),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 0);
            },
            itemCount: controller.placeResulte.length),
      ),
    );
  }
}
