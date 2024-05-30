import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../../../core/services/google_maps_places_services.dart';
import '../../controller/favorite_controller.dart';
import 'favorite_item.dart';

class FavoriteListView extends GetView<FavoriteController> {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        // height: 200,
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 1.0, // Aspect ratio of the cards
            crossAxisSpacing: 1, // Horizontal space between cards
            mainAxisSpacing: 1, // Vertical space between cards
          ),
          // scrollDirection: Axis.horizontal,
          itemCount: controller.placesDetails.length,
          itemBuilder: (context, index) {
            var place = controller.placesDetails[index];

            return FavorieItem(
              placesDetails: place,
              onTap: () async {
                GoogleMapsPlacesService googleMapsPlacesService =
                    GoogleMapsPlacesService();
                var result = await googleMapsPlacesService.getPlaceDetails(
                    placeId: place.placeId.toString());
                Get.toNamed(AppRoute.addOrder,
                    arguments: {"palcemodel": result});
              },
            );
          },
        ),
      ),
    );
  }
}
