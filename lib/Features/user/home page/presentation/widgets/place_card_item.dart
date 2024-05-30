import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/data/models/place_model/place_model.dart';
import '../../../../../core/utils/utils.dart';
import '../../../favorite/controller/favorite_controller.dart';
import '../../controllers/home_page_controller.dart';

class PlaceCardItem extends GetView<HomePageController> {
  const PlaceCardItem({
    super.key,
    required this.place,
    required this.favType,
    required this.onTap,
    this.imageHeight = 160,
  });
  final PlaceModel place;
  final String favType;
  final void Function() onTap;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    place.photos != null && place.photos!.isNotEmpty
                        ? "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${place.photos![0].photoReference}&key=${Utils.googleMapsPlacesApiKey}"
                        : "https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png",
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: imageHeight,
                        child: Center(
                          child: Icon(
                            Icons.store,
                            size: 48,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Text(
                            place.rating.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Positioned(
                      top: 8,
                      left: 8,
                      child: GestureDetector(
                        onTap: () {
                          controller.favoritePlaceIds.contains(place.placeId)
                              ? controller.removeFavorite(
                                  placeid: place.placeId.toString())
                              : controller.addFavorite(
                                  placeid: place.placeId.toString(),
                                  type: favType,
                                );

                          controller.getFavHomeData();
                          Get.delete<FavoriteController>();
                          FavoriteController c = Get.find();
                          controllerFav.refreshScreen();
                          c.update();
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          child: Icon(
                            Icons.favorite,
                            color: controller.favoritePlaceIds
                                    .contains(place.placeId)
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      place.vicinity.toString(),
                      style: const TextStyle(
                        fontSize: 9,
                        color: AppColor.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
