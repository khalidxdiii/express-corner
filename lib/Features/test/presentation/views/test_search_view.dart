// import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
// import 'package:express_corner/core/constant/colors.dart';
// import 'package:express_corner/core/data/models/place_details_model/place_details_model.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:uuid/uuid.dart';

// import '../../../../../core/constant/approutes.dart';
// import '../../../../../core/functions/validinput.dart';
// import '../../../../../core/shared/defult_textformfield.dart';
// import '../../../../core/data/models/place_autocomplete_model/place_autocomplete_model.dart';
// import '../../../../core/data/models/place_details_model/geometry.dart';
// import '../../../../core/data/models/place_details_model/location.dart';
// import '../../../../core/services/google_maps_places_services.dart';

// class TestSearchView extends StatelessWidget {
//   const TestSearchView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TestSearchController controller = Get.put(TestSearchController());
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             // ...Other widgets if necessary
//             DynamicFormPlaces(),
//             ElevatedButton(
//               onPressed: () => controller.saveAllPlaces(),
//               child: Text('Save All Places'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DynamicFormPlaces extends StatelessWidget {
//   const DynamicFormPlaces({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TestSearchController>(
//       builder: (controller) => Container(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: List.generate(controller.searchControllers.length, (index) {
//             return Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: CustomDefaultTextFormField(
//                           myController: controller.searchControllers[index],
//                           hintText: "Search for a place",
//                           labelText: "Search",

//                           floatingLabelBehavior: FloatingLabelBehavior.never,
//                           removePrefixIcon: true,

//                           focusNode: controller
//                               .focusNodes[index], // Pass the focus node here
//                         ),
//                       ),
//                     ),
//                     if (controller.searchControllers.length >
//                         1) // Remove button condition
//                       IconButton(
//                         icon: Icon(Icons.remove_circle_outline),
//                         onPressed: () => controller.removeSearchField(index),
//                       ),
//                   ],
//                 ),
//                 if (controller.placeResulte.isNotEmpty &&
//                     controller.showSearchItem[index])
//                   CustomSearchItem(
//                     index: index,
//                     onPlaceSelect: (PlaceDetailsModel placeDetails) {
//                       controller.savePlaceDetails(index, placeDetails);
//                     },
//                   ),
//               ],
//             );
//           })
//             ..add(
//               ElevatedButton(
//                 onPressed: controller.addSearchField,
//                 child: const Text('Add Search Field'),
//               ),
//             ),
//         ),
//       ),
//     );
//   }
// }

// class CustomSearchItem extends StatelessWidget {
//   final int index;
//   final void Function(PlaceDetailsModel) onPlaceSelect;

//   const CustomSearchItem({
//     super.key,
//     required this.index,
//     required this.onPlaceSelect,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TestSearchController>(
//       builder: (controller) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey), // Use your AppColor.fithColor
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white,
//         ),
//         child: ListView.separated(
//           shrinkWrap: true,
//           itemBuilder: (context, idx) {
//             return GestureDetector(
//               onTap: () async {
//                 var placeDetails =
//                     await controller.googleMapsPlacesService.getPlaceDetails(
//                   placeId: controller.placeResulte[idx].placeId.toString(),
//                 );
//                 // Save the selected place details (this also updates the search text field with the place name)
//                 onPlaceSelect(placeDetails);
//                 // Clear the search results after selection
//                 controller.placeResulte.clear();
//                 controller.update();
//               },
//               child: ListTile(
//                 title: Text(controller.placeResulte[idx].description!),
//               ),
//             );
//           },
//           separatorBuilder: (context, idx) => const Divider(height: 0),
//           itemCount: controller.placeResulte.length,
//         ),
//       ),
//     );
//   }
// }

// class CustomDefaultTextFormField extends StatelessWidget {
//   final TextEditingController myController;
//   final String hintText;
//   final Function(String)? onChanged;
//   final FocusNode focusNode;
//   final String? labelText; // Optional label text
//   final bool removePrefixIcon; // Whether to remove the prefix icon
//   final FloatingLabelBehavior?
//       floatingLabelBehavior; // Control the floating label

//   const CustomDefaultTextFormField({
//     Key? key,
//     required this.myController,
//     required this.hintText,
//     this.onChanged,
//     required this.focusNode,
//     required this.labelText,
//     required this.removePrefixIcon,
//     required this.floatingLabelBehavior,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: myController,
//       decoration: InputDecoration(
//         hintText: hintText,
//         labelText: labelText,
//         border: OutlineInputBorder(),
//         prefixIcon: removePrefixIcon
//             ? null
//             : Icon(Icons.search), // Conditional prefix icon
//         floatingLabelBehavior:
//             floatingLabelBehavior ?? FloatingLabelBehavior.auto,
//       ),
//       onChanged: onChanged,
//       focusNode: focusNode,
//     );
//   }
// }

// class TestSearchController extends GetxController {
//   List<PlaceAutocompleteModel> placeResulte = [];
//   late GoogleMapsPlacesService googleMapsPlacesService;
//   late Uuid uuid;
//   String? sesstionToken;
//   // New part for managing multiple search controllers and latLng values
//   List<TextEditingController> searchControllers = [];
//   List<Map<String, dynamic>> selectedPlaces = [];
//   late List<bool> showSearchItem;
//   List<FocusNode> focusNodes = [];

//   TestSearchController() {
//     showSearchItem = []; // Initialized in the constructor
//   }

//   void fetchPredictions(int index) {
//     searchControllers[index].addListener(
//       () async {
//         if (searchControllers[index].text.isNotEmpty) {
//           sesstionToken ??= uuid.v4();
//           var result = await googleMapsPlacesService.getPredictions(
//             input: searchControllers[index].text,
//             type: "restaurant",
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

//   List<LatLng> parseLatLngString(String latLngString) {
//     // Remove "LatLng(" and ")" from the string
//     latLngString = latLngString.replaceAll('LatLng(', '').replaceAll(')', '');

//     // Split the string by "-"
//     List<String> latLngPairs = latLngString.split('-');

//     // Create a list to store LatLng objects
//     List<LatLng> latLngList = [];

//     // Iterate through each pair and create LatLng objects
//     for (String latLngPair in latLngPairs) {
//       // Split the pair by ", "
//       List<String> latLngValues = latLngPair.split(', ');

//       // Parse latitude and longitude values
//       double latitude = double.parse(latLngValues[0]);
//       double longitude = double.parse(latLngValues[1]);

//       // Create LatLng object and add it to the list
//       latLngList.add(LatLng(latitude, longitude));
//     }

//     return latLngList;
//   }

//   @override
//   void onInit() {
//     googleMapsPlacesService = GoogleMapsPlacesService();
//     uuid = const Uuid();
//     // addSearchField(); // Initialize with one search field
//     addSearchField(
//         initialPlace: "my test place", initialLatLng: LatLng(31.5012, 20.123));
//     calculateDistances(userLocation, placesLocations);


//     String latLngString =
//         "LatLng(30.9578519, 31.2410059)-LatLng(30.9578519, 31.2410059)";
//     List<LatLng> latLngList = parseLatLngString(latLngString);

//     print(latLngList);
//     print(latLngList.first.latitude);
//     super.onInit();
//   }

//   void addSearchField({String initialPlace = "", LatLng? initialLatLng}) {
//     TextEditingController newController =
//         TextEditingController(text: initialPlace);
//     FocusNode newFocusNode = FocusNode();

//     searchControllers.add(newController);
//     focusNodes.add(newFocusNode);
//     selectedPlaces
//         .add({'lat': initialLatLng?.latitude, 'lng': initialLatLng?.longitude});
//     showSearchItem.add(true);

//     if (initialPlace.isNotEmpty && initialLatLng != null) {
//       // Ensure that you have a correct constructor in PlaceDetailsModel
//       savePlaceDetails(
//           searchControllers.length - 1,
//           PlaceDetailsModel(
//               name: initialPlace,
//               geometry: Geometry(
//                   location: Location(
//                       lat: initialLatLng.latitude,
//                       lng: initialLatLng.longitude))));
//     } else {
//       fetchPredictions(searchControllers.length - 1);
//     }

//     update();
//     Future.delayed(Duration(milliseconds: 100), () {
//       focusNodes.last.requestFocus(); // Focus on the newly added search field
//     });
//   }

//   void savePlaceDetails(int index, PlaceDetailsModel placeDetails) {
//     searchControllers[index].text = placeDetails.name ?? 'Selected Place';
//     selectedPlaces[index] = {
//       'lat': placeDetails.geometry?.location?.lat,
//       'lng': placeDetails.geometry?.location?.lng
//     };
//     showSearchItem[index] = false;
//     update();
//     printSelectedPlacesLatLong();
//   }

//   void removeSearchField(int index) {
//     try {
//       if (searchControllers.length > 1) {
//         searchControllers.removeAt(index);
//         focusNodes.removeAt(index);
//         selectedPlaces.removeAt(index);
//         showSearchItem.removeAt(index);
//         update();
//       }
//       printSelectedPlacesLatLong();
//     } catch (e) {
//       print("Error removing search field: $e");
//       // Optionally, handle the error by displaying a message to the user
//     }
//   }

//   void printSelectedPlacesLatLong() {
//     // Filter places that have both lat and lng defined, and print them
//     selectedPlaces
//         .where((place) => place['lat'] != null && place['lng'] != null)
//         .forEach((place) {
//       print("/////////////////");
//       print('Lat: ${place['lat']}, Lng: ${place['lng']}');
//       print("/////////////////");
//     });
//   }

//   List<String> placeNames = [];
//   List<LatLng> latLngs = [];

//   void saveAllPlaces() {
//     placeNames.clear();
//     latLngs.clear();

//     for (var place in selectedPlaces) {
//       if (place['lat'] != null && place['lng'] != null) {
//         latLngs.add(LatLng(place['lat'], place['lng']));
//         // Assuming each place has a corresponding controller that holds the name
//         int index = selectedPlaces.indexOf(place);
//         placeNames.add(searchControllers[index].text);
//       }
//     }

//     // Optional: print or handle the lists as needed
//     print("Place Names: ${placeNames.join(", ")}");
//     print("LatLngs: ${latLngs.join(", ")}");
//   }

// //////////// test distance func
//   ///

//   // Define the user's location (Cairo, Egypt)
//   LatLng userLocation = LatLng(30.0444, 31.2357);

//   // Define a list of locations
//   List<LatLng> placesLocations = [
//     LatLng(29.9792, 31.1342), // Pyramids of Giza
//     LatLng(30.0459, 31.2243), // Cairo Tower
//     LatLng(30.0444, 31.2358), // Tahrir Square
//     // LatLng(30.9578519, 31.2410059),
//   ];

// // Function to calculate distance between user's location and multiple place locations
//   double totalCost = 0.0; // Ensure it's initialized as a double

//   // Function to calculate distance between a user's location and multiple places
//   void calculateDistances(
//       LatLng userLocation, List<LatLng> placesLocations) async {
//     double totalDistanceInKilometers = 0.0; // Initialize as a double

//     for (LatLng placeLocation in placesLocations) {
//       double distanceInMeters = await Geolocator.distanceBetween(
//           userLocation.latitude,
//           userLocation.longitude,
//           placeLocation.latitude,
//           placeLocation.longitude);
//       totalDistanceInKilometers +=
//           distanceInMeters / 1000; // Dividing ensures result is double
//     }

//     calculateCost(totalDistanceInKilometers);
//     print("Total Cost: $totalCost EGP");
//     update(); // Update the state/UI if necessary
//   }

//   // Function to calculate cost based on total distance
//   void calculateCost(double totalDistanceInKilometers) {
//     if (totalDistanceInKilometers <= 1) {
//       totalCost = 10.0; // Explicitly set as a double
//     } else {
//       // Explicitly handle calculations as double
//       totalCost = 10.0 + (totalDistanceInKilometers - 1) * 5.0;
//     }

//     update(); // Assuming 'update()' is a method to refresh the UI or some state
//   }
// }

// class PlaceSearchForm {
//   String id;
//   TextEditingController searchController;
//   PlaceDetailsModel? selectedPlace;
//   List<PlaceAutocompleteModel> searchResults;

//   PlaceSearchForm({
//     required this.id,
//     required this.searchController,
//     this.selectedPlace,
//     this.searchResults = const [],
//   });
// }
