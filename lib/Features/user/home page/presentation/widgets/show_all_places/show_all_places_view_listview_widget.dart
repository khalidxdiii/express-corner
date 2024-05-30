import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/approutes.dart';
import '../../../../../../core/data/models/place_model/place_model.dart';
import '../../../../../../core/services/google_maps_places_services.dart';
import '../place_card_item.dart';

class ShowAllPlacesListViewWidget extends StatelessWidget {
  const ShowAllPlacesListViewWidget({
    super.key,
    required this.pharmaciesPlacesList,
  });
  final RxList<PlaceModel> pharmaciesPlacesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(() {
        // Check if places list is empty, show a loading indicator
        if (pharmaciesPlacesList.isEmpty) {
          return SizedBox(
              height: Get.height * 0.6,
              child: const Center(child: CircularProgressIndicator()));
        }

        return SizedBox(
          // height: 300,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              childAspectRatio: 1.0, // Aspect ratio of the cards
              crossAxisSpacing: 2, // Horizontal space between cards
              mainAxisSpacing: 5, // Vertical space between cards
            ),
            itemCount: pharmaciesPlacesList.length,
            itemBuilder: (context, index) {
              final PlaceModel place = pharmaciesPlacesList[index];

              return PlaceCardItem(
                place: place,
                imageHeight: 110,
                favType: "pharmacy",
                onTap: () async {
                  GoogleMapsPlacesService googleMapsPlacesService =
                      GoogleMapsPlacesService();
                  var result = await googleMapsPlacesService.getPlaceDetails(
                      placeId: place.placeId.toString());
                  Get.toNamed(AppRoute.addOrder,
                      arguments: {"palcemodel": result});
                  print("/////////////////////////////////////");
                  print(result.placeId);
                },
              );
            },
          ),
        );
      }),
    );
  }
}
