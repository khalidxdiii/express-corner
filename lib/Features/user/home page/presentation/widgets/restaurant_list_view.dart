import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/services/google_maps_places_services.dart';
import '../../controllers/home_page_controller.dart';
import 'place_card_item.dart';

class RestaurantListView extends GetView<HomePageController> {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(() {
        // Check if places list is empty, show a loading indicator
        if (controller.restaurantPlacesList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          // height: 300,
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Number of columns
              childAspectRatio: 1.0, // Aspect ratio of the cards
              crossAxisSpacing: 10, // Horizontal space between cards
              mainAxisSpacing: 10, // Vertical space between cards
            ),
            scrollDirection: Axis.horizontal,
            itemCount: controller.restaurantPlacesList.length,
            itemBuilder: (context, index) {
              final place = controller.restaurantPlacesList[index];

              return PlaceCardItem(
                place: place,
                favType: "resturant",
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
