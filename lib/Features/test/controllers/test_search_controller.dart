// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uuid/uuid.dart';

// import '../../../core/data/models/place_autocomplete_model/place_autocomplete_model.dart';
// import '../../../core/services/google_maps_places_services.dart';

// class TestSearchController extends GetxController {
//   List<PlaceAutocompleteModel> placeResulte = [];
//   late TextEditingController searchController;
//   late GoogleMapsPlacesService googleMapsPlacesService;
//   late Uuid uuid;
//   String? sesstionToken;

//   void fetchPredictions() {
//     searchController.addListener(
//       () async {
//         if (searchController.text.isNotEmpty) {
//           sesstionToken ??= uuid.v4();
//           var result = await googleMapsPlacesService.getPredictions(
//             input: searchController.text,
//             type: "resturant",
//             sesstionToken: sesstionToken!,
//           );
//           placeResulte.clear();
//           placeResulte.addAll(result);

//           update();
//         } else {
//           placeResulte.clear();
//           update();
//         }
//       },
//     );
//   }

//   @override
//   void onInit() {
//     googleMapsPlacesService = GoogleMapsPlacesService();
//     searchController = TextEditingController();
//     uuid = const Uuid();
//     fetchPredictions();
//     super.onInit();
//   }
// }
