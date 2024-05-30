import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import '../../../../core/data/models/place_model/place_model.dart';
import '../../../../core/services/google_maps_places_services.dart';
import '../../../../core/utils/utils.dart';

abstract class ShowAllPlacesController extends GetxController {
  fetchPredictions();
}

class ShowAllPlacesControllerImp extends ShowAllPlacesController {
  List<PlaceAutocompleteModel> placeResulte = [];
  late TextEditingController searchController;
  late GoogleMapsPlacesService googleMapsPlacesService;
  RxList<PlaceModel> pharmaciesPlacesList = <PlaceModel>[].obs;
  final places = GoogleMapsPlaces(apiKey: Utils.googleMapsPlacesApiKey);
  var currentLocation = Rxn<LatLng>();
  late Uuid uuid;
  String? sesstionToken;
  late String type;
  late String pageTitle;
  late String searchHint;

  void getCurrentLocation() async {
    bool _serviceEnabled;
    LocationPermission _permissionGranted;
    Position _position;

    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Geolocator.openLocationSettings();
      if (!_serviceEnabled) {
        return;
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
        radius: 5000, type: type, placesList: pharmaciesPlacesList);
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

  @override
  void onInit() {
    type = Get.arguments["type"];
    pageTitle = Get.arguments["pageTitle"];
    searchHint = Get.arguments["searchHint"];
    googleMapsPlacesService = GoogleMapsPlacesService();
    searchController = TextEditingController();
    uuid = const Uuid();
    fetchPredictions();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void fetchPredictions() {
    searchController.addListener(
      () async {
        if (searchController.text.isNotEmpty) {
          sesstionToken ??= uuid.v4();
          var result = await googleMapsPlacesService.getPredictions(
            input: searchController.text,
            type: type,
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
}
