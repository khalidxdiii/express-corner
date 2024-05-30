import 'dart:convert';
import 'dart:io';

import 'package:express_corner/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import '../../../../core/data/models/place_details_model/geometry.dart';
import '../../../../core/data/models/place_details_model/location.dart';
import '../../../../core/data/models/place_details_model/place_details_model.dart';
import '../../../../core/functions/handlingdata.dart';

import '../../../../core/functions/upload_file.dart';
import '../../../../core/services/google_maps_places_services.dart';
import '../../../empthy status/presentation/views/status_success_view.dart';
import '../../profile/controllers/address/view_controller.dart';
import '../data/datasource/remote/add_orders_data.dart';
import '../presintaion/widgets/add_new_order/page_one.dart';
import '../presintaion/widgets/add_new_order/page_three.dart';
import '../presintaion/widgets/add_new_order/page_two.dart';
import 'package:http/http.dart' as http;

abstract class AddOrderController extends ViewAdressControllerImp {
  addOrder();
  nextPage();
}

class AddOrderControllerImp extends AddOrderController {
  late PlaceDetailsModel placeModel;
  late GlobalKey<FormState> key;
  late PageController? pageController;

  AddOrdersData ordersData = AddOrdersData(Get.find());

// image section
  File? file;

  showOpitionImage() {
    showBottomMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(isSvg: false);
    update();
  }

  deleteImage() {
    file = null;
    update();
  }

// end image section

// // Observable list to store selected images
//   List<File> selectedImages = [];

//   // Function to pick multiple images and add them to the existing list
//   Future<void> pickImages() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.image,
//     );

//     if (result != null) {
//       // Adding new selections to the existing list
//       selectedImages.addAll(result.paths.map((path) => File(path!)).toList());
//       print("/////////////////////");
//       print(selectedImages);
//       print(selectedImages[0].path);
//       update(); // Use GetBuilder's update() method to update the UI
//     } else {
//       // User canceled the picker
//       print("No images selected");
//     }
//   }

  String? addressId;
  String? addressGov;
  String? addressCity;
  String? addressDetails;
  String? addressType;
  late String userNotes;
  // String? addressLat;
  // String? addressLong;

  var locationControllers = <TextEditingController>[].obs;
  var detailsControllers = <TextEditingController>[].obs;
  late TextEditingController notesControllers;

  late TextEditingController price;
  int currentPage = 0;

//check the distance between two locations
  late double startLatitude;
  late double startLongitude;
  double? endLatitude;
  double? endLongitude;

  // Observable variable to store the distance
  var distanceInKilometers = 0.0;
  // int cost = 0;
  var orderPrice = 0;
  var totalPriceWithShipping = 0;

  void calcTotalPriceWithShipping(String value) {
    orderPrice = 0;
    orderPrice = int.parse(value);
    totalPriceWithShipping = orderPrice + totalCost.toInt();
    update();
  }

///////////////////////////////////  section calc distance ///////////////////////////////

//   // Function to calculate distance between two locations
//   void calculateDistance(double startLatitude, double startLongitude,
//       double endLatitude, double endLongitude) async {
//     double distanceInMeters = Geolocator.distanceBetween(
//         startLatitude, startLongitude, endLatitude, endLongitude);
//     // Convert meters to kilometers and round to 1 decimal place
//     double distanceInKilometers = distanceInMeters / 1000;
//     // Calculate cost based on distance
//     calculateCost(distanceInKilometers);
//   }

// // Function to calculate cost
//   void calculateCost(double distanceInKilometers) {
//     if (distanceInKilometers <= 1) {
//       // If distance is less than or equal to 1 kilometer, cost is 10 EGP
//       cost = 10;
//     } else {
//       // The first kilometer costs 10 EGP
//       // Each additional kilometer costs 5 EGP
//       // Subtract the first kilometer from the total distance then multiply each additional kilometer by 5 EGP
//       // Add the initial 10 EGP for the first kilometer
//       cost = 10 + ((distanceInKilometers - 1) * 5).toInt();
//     }

//     // Assuming 'update()' is a method to refresh the UI or some state
//     update();
//   }

  double totalCost = 0.0; // Ensure it's initialized as a double

  // Function to calculate distance between a user's location and multiple places
  void calculateDistances(
      LatLng userLocation, List<LatLng> placesLocations) async {
    double totalDistanceInKilometers = 0.0; // Initialize as a double

    for (LatLng placeLocation in placesLocations) {
      double distanceInMeters = await Geolocator.distanceBetween(
          userLocation.latitude,
          userLocation.longitude,
          placeLocation.latitude,
          placeLocation.longitude);
      totalDistanceInKilometers +=
          distanceInMeters / 1000; // Dividing ensures result is double
    }

    calculateCost(totalDistanceInKilometers);
    print("Total Cost: $totalCost EGP");
    update(); // Update the state/UI if necessary
  }

  // Function to calculate cost based on total distance
  void calculateCost(double totalDistanceInKilometers) {
    if (totalDistanceInKilometers <= 1) {
      totalCost = 10.0; // Explicitly set as a double
    } else {
      // Explicitly handle calculations as double
      totalCost = 10.0 + (totalDistanceInKilometers - 1) * 5.0;
    }
    totalCost = totalCost.toInt().toDouble();
    update(); // Assuming 'update()' is a method to refresh the UI or some state
  }

/////////////////////////  end secetion /////////////////////////
  List<Widget> pages = const [
    PageOne(),
    PageTwo(),
    PageThree(),
  ];

  List<String> pagesName = [
    "طلباتك",
    "العنوان",
    "الدفع",
  ];

  @override
  addOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.addOrdersData(
      usersid: myServices.sharedPreferences.getString("id").toString(),
      addressid: addressId.toString(),
      orderPlaceId: placeModel.placeId.toString(),
      orderstype: "0",
      pricedelivary: totalCost.toString(),
      ordersprice: orderPrice.toString(),
      // locationName: locationControllers
      //     .map((controller) => controller.text)
      //     .toList()
      //     .join(", "),
      itemDetails: detailsControllers
          .map((controller) => controller.text)
          .toList()
          .join(", "),
      orderNotes: userNotes,
      addressUserGov: addressGov.toString(),
      addressUserCity: addressCity.toString(),
      addressUserDetails: addressDetails.toString(),
      addressUserType: addressType.toString(),
      addressUserLat: endLatitude.toString(),
      addressUserLong: endLongitude.toString(),
      toAddressName: placeModel.name.toString(),
      // toAddressDetails: placeModel.vicinity.toString(),
      // toAddressLat: placeModel.geometry!.location!.lat.toString(),
      // toAddressLong: placeModel.geometry!.location!.lng.toString(),
      file: file,

      //
      ordersLocationCoordinates: latLngs.join("- "),
      locationName: placeNames.join(", "),
    );
    debugPrint('==================== Add Orders Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.off(
          StatusSuccessView(
            title: "تم تأكيد طلبك بنجاح",
            body: "سيتم مهاتفتك عن طريق السائق عن وصول طلبك.",
            onPressed: () {
              Get.back();
            },
          ),
        );
        // print("///////////////////");
        // print("ok");
        // print(selectedImages[0].path);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // uploadImages() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await ordersData.uploadMultipleImage(
  //     file: selectedImages,
  //   );
  //   debugPrint('==================== Add Orders Controller $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       print("///////////////////");
  //       print("ok");
  //       print(selectedImages[0].path.split('/').last);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  void onInit() {
    // view();
    key = GlobalKey<FormState>();
    pageController = PageController();
    notesControllers = TextEditingController();
    price = TextEditingController();
    placeModel = Get.arguments["palcemodel"];

    print(placeModel.name);
    addLocationTextFormField(initialText: placeModel.name.toString());
    adddetailsTextFormField();
    startLatitude = placeModel.geometry!.location!.lat!.toDouble();
    startLongitude = placeModel.geometry!.location!.lng!.toDouble();

    //////////
    googleMapsPlacesService = GoogleMapsPlacesService();
    uuid = const Uuid();
    addSearchField(
        initialPlace: placeModel.name.toString(),
        initialLatLng: LatLng(
            double.parse(placeModel.geometry!.location!.lat.toString()),
            double.parse(placeModel.geometry!.location!.lng.toString())));

    super.onInit();
  }

  void addLocationTextFormField({String initialText = ""}) {
    locationControllers.add(TextEditingController(text: initialText));
    selectedPlaceNums.add(1);

    update();
  }

  void adddetailsTextFormField() {
    detailsControllers.add(TextEditingController());
    selectedPlaceNums.add(1);
    update();
  }

  void printValues() {
    for (var controller in locationControllers) {
      print("//////////////////////");
      print(controller.text);
    }
  }

  // void removeLocationTextFormField(int index) {
  //   locationControllers[index].dispose();
  //   locationControllers.removeAt(index);
  // }

  void removeLocationTextFormField(int index) {
    if (index < locationControllers.length && index >= 0) {
      locationControllers[index].dispose();
      locationControllers.removeAt(index);

      // Adjust the selectedPlaceNums if they point to the removed location or any location after it.
      for (int i = 0; i < selectedPlaceNums.length; i++) {
        if (selectedPlaceNums[i] > index + 1) {
          // Assuming placeNum starts from 1
          selectedPlaceNums[i] = selectedPlaceNums[i] - 1;
        } else if (selectedPlaceNums[i] == index + 1) {
          // If the removed location was selected, set it to a default value or adjust accordingly.
          // Here, we'll set it to 1 as a simple strategy, or you could choose another approach.
          selectedPlaceNums[i] =
              1; // or perhaps set it to null or remove the entry if that's valid for your logic
        }
      }

      update(); // Notify listeners to update the UI if needed
    }
  }

  // void removeDetailsTextFormField(int index) {
  //   detailsControllers[index].dispose();
  //   detailsControllers.removeAt(index);
  // }
  void removeDetailsTextFormField(int index) {
    if (index < detailsControllers.length && index >= 0) {
      detailsControllers[index].dispose();
      detailsControllers.removeAt(index);
      selectedPlaceNums.removeAt(index);
      update();
    }
  }

  // Define the setSelectedPlaceNum method
  var selectedPlaceNums = <int>[].obs;
  void setSelectedPlaceNum(int index, int placeNum) {
    if (index >= 0 && index < selectedPlaceNums.length) {
      selectedPlaceNums[index] = placeNum;
      update(); // Notify listeners to update the UI if needed
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  changePage() {
    if (currentPage == 0) {
      // if (locationControllers.first.text.isEmpty) {
      if (containsNullCoordinates(selectedPlaces) == true) {
        Get.snackbar(
          "تنبية",
          "يجب ادخال عنوان الطلب",
          backgroundColor: AppColor.fithColor,
          colorText: AppColor.primaryColor,
        );
      } else {
        if (detailsControllers.first.text.isEmpty) {
          Get.snackbar(
            "تنبية",
            "يجب ادخال تفاصيل الطلب",
            backgroundColor: AppColor.fithColor,
            colorText: AppColor.primaryColor,
          );
        } else {
          // if (key.currentState!.validate()) {
          //   // uploadImages();
          //   nextPage();
          // }
          handlingUserNotes();
          saveAllPlaces();
          print(placeNames.join(", "));
          print(latLngs.join("- "));
          nextPage();
        }
      }
    } else if (currentPage == 1) {
      if (addressId != null) {
        // calculateDistance(
        //     startLatitude, startLongitude, endLatitude!, endLongitude!);
        // totalPriceWithShipping = cost;

        calculateDistances(LatLng(endLatitude!, endLongitude!), latLngs);
        update();
        totalPriceWithShipping = totalCost.toInt();
        update();

        nextPage();
      } else {
        Get.snackbar(
          "تنبية",
          "يجب اختيار عنوان الطلب",
          backgroundColor: AppColor.fithColor,
          colorText: AppColor.primaryColor,
        );
      }
    } else if (currentPage == 2) {
      if (price.text == "0" || price.text.isEmpty) {
        Get.snackbar(
          "تنبية",
          "يجب تحديد السعر التقريبى للطلب",
          backgroundColor: AppColor.fithColor,
          colorText: AppColor.primaryColor,
        );
      } else {
        nextPage();
      }
    } else {
      addOrder();
    }
  }

  @override
  nextPage() {
    currentPage++;
    if (currentPage > pages.length - 1) {
      addOrder();
      // myServices.sharedPreferences.setString("step", "1");
      // Get.offAllNamed(AppRoute.login);
    } else {
      if (pageController!.hasClients) {
        pageController!.animateToPage(currentPage,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOut);
      }
    }
    update();
  }

  handlingUserNotes() {
    if (notesControllers.text.isEmpty) {
      userNotes = "لا يوجد ملاحظات";
    } else {
      userNotes = notesControllers.text;
    }
  }

  Future<bool> onWillPop() {
    if (currentPage > 0) {
      currentPage--;
      pageController!.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
      update();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  chooseShippingAddress({
    required String id,
    required double userAddresslat,
    required double userAddressLong,
    required String addressUserGov,
    required String addressUserCity,
    required String addressUserDetails,
    required String addressUserType,
    // required String addressUserLat,
    // required String addressUserLong,
  }) {
    addressId = id;
    endLatitude = userAddresslat;
    endLongitude = userAddressLong;

    addressGov = addressUserGov;
    addressCity = addressUserCity;
    addressDetails = addressUserDetails;
    addressType = addressUserType;
    // addressLat = addressUserLat;
    // addressLong = addressUserLong;
    update();
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is removed from memory
    for (var controller in locationControllers) {
      controller.dispose();
    }

    for (var controller2 in detailsControllers) {
      controller2.dispose();
    }
    super.onClose();
  }

  @override
  void dispose() {
    onClose();
    price.dispose();
    super.dispose();
  }

  var placeSuggestions = <String>[].obs;
  Future<void> fetchPlaceSuggestions(String input) async {
    if (input.isEmpty) {
      placeSuggestions.clear();
      return;
    }

    final String apiKey = Utils
        .googleMapsPlacesApiKey; // Make sure to securely store your API key
    final String baseUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final String requestUrl =
        '$baseUrl?input=$input&key=$apiKey&language=en&components=country:eg';

    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final predictions = jsonResponse['predictions'] as List;

        // Assuming you want to display the description of each place suggestion
        placeSuggestions.value =
            predictions.map((p) => p['description'].toString()).toList();
      } else {
        // Handle failure
        print('Failed to fetch suggestions');
      }
    } catch (e) {
      // Handle exceptions
      print('Error fetching suggestions: $e');
    }
  }

//////////////  search places ////////////////
  List<PlaceAutocompleteModel> placeResulte = [];
  late GoogleMapsPlacesService googleMapsPlacesService;
  late Uuid uuid;
  String? sesstionToken;
  // New part for managing multiple search controllers and latLng values
  List<TextEditingController> searchControllers = [];
  List<Map<String, dynamic>> selectedPlaces = [];
  late List<bool> showSearchItem;
  List<FocusNode> focusNodes = [];

  AddOrderControllerImp() {
    showSearchItem = []; // Initialized in the constructor
  }

  void fetchPredictions(int index) {
    searchControllers[index].addListener(
      () async {
        if (searchControllers[index].text.isNotEmpty) {
          sesstionToken ??= uuid.v4();
          var result = await googleMapsPlacesService.getPredictionsWithoutType(
            input: searchControllers[index].text,
            sesstionToken: sesstionToken!,
          );
          placeResulte.clear();
          placeResulte.addAll(result);
          update();
        } else {
          placeResulte.clear();
          update();
        }
      },
    );
  }

  void addSearchField({String initialPlace = "", LatLng? initialLatLng}) {
    TextEditingController newController =
        TextEditingController(text: initialPlace);
    FocusNode newFocusNode = FocusNode();

    searchControllers.add(newController);
    focusNodes.add(newFocusNode);
    selectedPlaces
        .add({'lat': initialLatLng?.latitude, 'lng': initialLatLng?.longitude});
    showSearchItem.add(true);

    if (initialPlace.isNotEmpty && initialLatLng != null) {
      // Ensure that you have a correct constructor in PlaceDetailsModel
      savePlaceDetails(
          searchControllers.length - 1,
          PlaceDetailsModel(
              name: initialPlace,
              geometry: Geometry(
                  location: Location(
                      lat: initialLatLng.latitude,
                      lng: initialLatLng.longitude))));
    } else {
      fetchPredictions(searchControllers.length - 1);
    }

    update();
    Future.delayed(Duration(milliseconds: 100), () {
      focusNodes.last.requestFocus(); // Focus on the newly added search field
    });
  }

  bool containsNullCoordinates(List<Map<String, dynamic>> selectedPlaces) {
    for (var place in selectedPlaces) {
      if (place['lat'] == null && place['lng'] == null) {
        return true; // Found a map with both lat and lng set to null
      }
    }
    return false; // No map with both lat and lng set to null found
  }

  void savePlaceDetails(int index, PlaceDetailsModel placeDetails) {
    searchControllers[index].text = placeDetails.name ?? 'ابحث باسم المكان';
    selectedPlaces[index] = {
      'lat': placeDetails.geometry?.location?.lat,
      'lng': placeDetails.geometry?.location?.lng
    };
    showSearchItem[index] = false;
    update();
    printSelectedPlacesLatLong();
  }

  void removeSearchField(int index) {
    try {
      if (searchControllers.length > 1) {
        searchControllers.removeAt(index);
        focusNodes.removeAt(index);
        selectedPlaces.removeAt(index);
        showSearchItem.removeAt(index);
        update();
      }
      printSelectedPlacesLatLong();
    } catch (e) {
      print("Error removing search field: $e");
      // Optionally, handle the error by displaying a message to the user
    }
  }

  void printSelectedPlacesLatLong() {
    // Filter places that have both lat and lng defined, and print them
    selectedPlaces
        .where((place) => place['lat'] != null && place['lng'] != null)
        .forEach((place) {
      print("/////////////////");
      print('Lat: ${place['lat']}, Lng: ${place['lng']}');
      print("/////////////////");
    });
  }

  List<String> placeNames = [];
  List<LatLng> latLngs = [];

  void saveAllPlaces() {
    placeNames.clear();
    latLngs.clear();

    for (var place in selectedPlaces) {
      if (place['lat'] != null && place['lng'] != null) {
        latLngs.add(LatLng(place['lat'], place['lng']));
        // Assuming each place has a corresponding controller that holds the name
        int index = selectedPlaces.indexOf(place);
        placeNames.add(searchControllers[index].text);
      }
    }

    // Optional: print or handle the lists as needed
    print("Place Names: ${placeNames.join(", ")}");
    print("LatLngs: ${latLngs.join("- ")}");
  }
}
