import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/data/models/place_details_model/place_details_model.dart';
import '../../../../../core/utils/utils.dart';
import '../../../home page/controllers/home_page_controller.dart';
import '../../controller/favorite_controller.dart';

class FavorieItem extends GetView<HomePageController> {
  const FavorieItem(
      {super.key, required this.placesDetails, required this.onTap});
  final PlaceDetailsModel placesDetails;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2.0,
        child: Container(
          // padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffE8E8E8).withOpacity(0.2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    placesDetails.photos != null &&
                            placesDetails.photos!.isNotEmpty
                        ? "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${placesDetails.photos![0].photoReference}&key=${Utils.googleMapsPlacesApiKey}"
                        : "https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png",
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 120,
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            placesDetails.rating.toString(),
                            style: const TextStyle(
                                color: Colors.white, height: 1.4),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GetBuilder<HomePageController>(
                    builder: (controller) => Positioned(
                      top: 8,
                      left: 8,
                      child: GestureDetector(
                        onTap: () {
                          // controller.removeFromMyFavorite(
                          //     placeid: placesDetails.placeId.toString());
                          controller.removeFavorite(
                              placeid: placesDetails.placeId.toString());
                          controller.data.removeWhere((element) =>
                              element.favoritePlaceid == placesDetails.placeId);
                          controller.placesDetails.removeWhere((element) =>
                              element.placeId == placesDetails.placeId);
                          controller.update();
                          Get.delete<HomePageController>();
                          HomePageController c = Get.find();
                          c.update();
                          // Get.delete<FavoriteController>();
                          // FavoriteController c2 = Get.find();
                          // c2.update();
                          // controller.favoriteController.refreshScreen();
                          controller.update();
                          controllerFav.refreshScreen();
                          // c.update();

                          // c2.refreshScreen();
                        },
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            child:
                                const Icon(Icons.favorite, color: Colors.red)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      placesDetails.name.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        // height: 1.4,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      placesDetails.formattedAddress.toString(),
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 9,
                        height: 1.4,
                        overflow: TextOverflow.ellipsis,
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
