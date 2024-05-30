import 'package:express_corner/core/class/statusRequest.dart';
import 'package:express_corner/core/services/services.dart';
import 'package:express_corner/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/data/models/place_details_model/place_details_model.dart';
import '../../../../core/data/models/place_model/place_model.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/google_maps_places_services.dart';

import '../../favorite/data/datasource/remote/favorite_dara.dart';
import '../../favorite/data/datasource/remote/myfavorite_data.dart';
import '../../favorite/data/models/myfavorite.dart';
import '../data/datasorce/remote/home_data.dart';

class HomePageController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest favStatusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  var currentLocation = Rxn<LatLng>();
  GoogleMapsPlacesService googleMapsPlacesService = GoogleMapsPlacesService();

  // FavoriteController favoriteController = Get.find();

  var restaurantPlacesList = <PlaceModel>[].obs;
  var pharmaciesPlacesList = <PlaceModel>[].obs;

  HomeData homeData = HomeData(Get.find());

  // RxList<String> favoritePlaceIds = <String>[].obs;

  List categories = [];

  List<PlaceModel> placeModelResturantData = <PlaceModel>[].obs;

  final places = GoogleMapsPlaces(apiKey: Utils.googleMapsPlacesApiKey);

  @override
  void onInit() {
    super.onInit();
    getData();
    // favoriteController.getFavHomeData();
    getFavHomeData();
    getCurrentLocation();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    debugPrint('==================== Home Category Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void getCurrentLocation() async {
    bool _serviceEnabled;
    LocationPermission _permissionGranted;
    Position _position;

    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Geolocator.openLocationSettings();
      if (!_serviceEnabled) {
        throw Exception("Location services are disabled");
      }
    }

    _permissionGranted = await Geolocator.checkPermission();
    if (_permissionGranted == LocationPermission.denied) {
      _permissionGranted = await Geolocator.requestPermission();
      if (_permissionGranted != LocationPermission.whileInUse &&
          _permissionGranted != LocationPermission.always) {
        return;
      }
    }

    _position = await Geolocator.getCurrentPosition();
    currentLocation.value = LatLng(_position.latitude, _position.longitude);
    fetchNearbyPlaces(
        radius: 2500, type: "restaurant", placesList: restaurantPlacesList);
    fetchNearbyPlaces(
        radius: 2500, type: "pharmacy", placesList: pharmaciesPlacesList);
  }

  void fetchNearbyPlaces({
    required num radius,
    required String? type,
    required RxList<PlaceModel> placesList,
  }) async {
    // Guard clause to ensure currentLocation is not null
    if (currentLocation.value == null) {
      print("Current location is null");
      // Optionally update the UI to reflect the error state
      return;
    }

    final location = Location(
      lat: currentLocation.value!.latitude,
      lng: currentLocation.value!.longitude,
    );

    googleMapsPlacesService.fetchNearbyPlaces(
        latitude: location.lat,
        longitude: location.lng,
        radius: radius,
        type: type!,
        placesList: placesList);
  }

////////////////

  FavoriteData favoriteDAta = FavoriteData(Get.find());
  MyFavoriteDate myFavoriteData = MyFavoriteDate(Get.find());
  // List data = [];
  List<MyFavoriteModel> data = [];
  RxList<String> favoritePlaceIds = <String>[].obs;
  // List<String> favoritePlaceIds = [];
  var placesDetails = <PlaceDetailsModel>[].obs;


  Future<List<String>> getFavHomeData() async {
    // List to hold the favorite placeIds

    try {
      // Assuming myServices.sharedPreferences.getString("id")! successfully retrieves the user ID
      var response = await myFavoriteData.getData(
        usersId: myServices.sharedPreferences.getString("id")!,
      );
      debugPrint('==================== MyFavorite Controller $response');

      // Check if the request was successful and the response contains data
      if (response['status'] == "success") {
        favoritePlaceIds.clear();
        List responseData = response['data'];

        // Convert each item in the responseData to a MyFavoriteModel and extract the placeId
        favoritePlaceIds.addAll(responseData.map(
            (e) => MyFavoriteModel.fromJson(e).favoritePlaceid.toString()));

        print(" ========= data ========");
        print(favoritePlaceIds);
      } else {
        // Optionally handle failure or invalid status
        print("Failed to fetch favorites: ${response['message']}");
      }
    } catch (e) {
      // Handle any exceptions during the request or parsing
      print('Exception occurred while fetching favorites: $e');
    }

    // Always return the list of favoritePlaceIds, which may be empty if there were errors
    return favoritePlaceIds;
  }

  addFavorite({required String placeid, required String type}) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteDAta.addFavorite(
      usersId: myServices.sharedPreferences.getString("id")!,
      placeid: placeid,
      type: type,
    );
    debugPrint('==================== favorite Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        // favoritePlaceIds.add(placeid);
        favoritePlaceIds.add(placeid);
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافه المنتج الى المفضله"));

        // Get.find<HomeControllerImp>().update();
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite({required String placeid}) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteDAta.deleteFavorite(
        usersId: myServices.sharedPreferences.getString("id")!,
        placeid: placeid);
    debugPrint('==================== favorite Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        favoritePlaceIds.removeWhere((element) => element == placeid);
        data.removeWhere((element) => element.favoritePlaceid == placeid);

        favoritePlaceIds.remove(placeid);
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضله"));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  // @override
  // void refresh() {
  //   // TODO: implement refresh
  //   super.refresh();
  //   Get.find<HomePageController>().favoritePlaceIds;
  // }
}
