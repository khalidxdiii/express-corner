import 'dart:convert';

import 'package:express_corner/core/utils/utils.dart';
import 'package:get/get.dart';

import '../data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:http/http.dart' as http;

import '../data/models/place_details_model/place_details_model.dart';
import '../data/models/place_model/place_model.dart';
import 'location_services.dart';

class GoogleMapsPlacesService {
  final String _baseUrl = 'https://maps.googleapis.com/maps/api/place';
  LocationServices locationService = LocationServices();
  Future<List<PlaceAutocompleteModel>> getPredictions(
      {required String input,
      required String type,
      required String sesstionToken}) async {
    // var currentLocation = await locationService.getLocation();
    // LatLng location =
    //     LatLng(currentLocation.latitude!, currentLocation.longitude!);

    // &location=$location&radius=500
    Uri url = Uri.parse(
        '$_baseUrl/autocomplete/json?input=$input&key=${Utils.googleMapsPlacesApiKey}&types=$type&language=ar&components=country:eg&sessiontoken=$sesstionToken');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['predictions'];
      List<PlaceAutocompleteModel> places = [];
      for (var item in data) {
        places.add(PlaceAutocompleteModel.fromJson(item));
      }

      return places;
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<List<PlaceAutocompleteModel>> getPredictionsWithoutType(
      {required String input, required String sesstionToken}) async {
    Uri url = Uri.parse(
        '$_baseUrl/autocomplete/json?input=$input&key=${Utils.googleMapsPlacesApiKey}&language=ar&components=country:eg&sessiontoken=$sesstionToken');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['predictions'];
      List<PlaceAutocompleteModel> places = [];
      for (var item in data) {
        places.add(PlaceAutocompleteModel.fromJson(item));
      }

      return places;
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    Uri url = Uri.parse(
        '$_baseUrl/details/json?place_id=$placeId&key=${Utils.googleMapsPlacesApiKey}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];

      return PlaceDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load place details');
    }
  }

  Future<void> fetchNearbyPlaces({
    required double latitude,
    required double longitude,
    required num radius,
    required String type,
    required RxList<PlaceModel> placesList,
  }) async {
    final String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    final String requestUrl =
        '$baseUrl?key=${Utils.googleMapsPlacesApiKey}&location=$latitude,$longitude&radius=$radius&type=$type';

    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 'OK') {
          List<dynamic> results = jsonResponse['results'];
          List<PlaceModel> places = results
              .map<PlaceModel>((json) => PlaceModel.fromJson(json))
              .toList();

          placesList.assignAll(places);
        } else {
          print("Error fetching places: ${jsonResponse['error_message']}");
          // Handle errors or set error state here
        }
      } else {
        print("Failed to load places data");
        // Handle HTTP errors here
      }
    } catch (e) {
      print("Exception caught while fetching places: $e");
      // Handle exceptions (e.g., parsing errors, network errors) here
    }
  }

// test autocomplete bu gov name
  // Future<List<PlaceAutocompleteModel>> getPredictionsByCityName({
  //   required String input,
  //   required String type,
  //   required String sesstionToken,
  // required  String? filterGovName, // Optional parameter for government name filtering
  // }) async {
  //   Uri url = Uri.parse(
  //       '$_baseUrl/autocomplete/json?input=$input&key=${Utils.googleMapsPlacesApiKey}&types=$type&language=ar&components=country:eg&sessiontoken=$sesstionToken');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body)['predictions'];
  //     List<PlaceAutocompleteModel> places = [];
  //     for (var item in data) {
  //       places.add(PlaceAutocompleteModel.fromJson(item));
  //     }

  //     // If filterGovName is not null, proceed with additional filtering
  //     if (filterGovName != null) {
  //       places = await _filterByGovernmentName(places, filterGovName);
  //     }

  //     return places;
  //   } else {
  //     throw Exception('Failed to load predictions');
  //   }
  // }

  // Method to filter places by government name
  // Future<List<PlaceAutocompleteModel>> _filterByGovernmentName(
  //     List<PlaceAutocompleteModel> places, String govName) async {
  //   List<PlaceAutocompleteModel> filteredPlaces = [];
  //   for (var place in places) {
  //     // Fetch place details
  //     Uri detailsUrl = Uri.parse(
  //         '$_baseUrl/details/json?place_id=${place.placeId}&key=${Utils.googleMapsPlacesApiKey}');
  //     var detailsResponse = await http.get(detailsUrl);
  //     if (detailsResponse.statusCode == 200) {
  //       var detailsData = jsonDecode(detailsResponse.body);
  //       PlaceDetailsModel details =
  //           PlaceDetailsModel.fromJson(detailsData['result']);

  //       // Check if the administrative area matches the govName
  //       if (details.addressComponents!.any((component) =>
  //           component.types!.contains("administrative_area_level_1") &&
  //           component.longName!
  //               .toLowerCase()
  //               .contains(govName.toLowerCase()))) {
  //         filteredPlaces.add(place);
  //       }
  //     }
  //   }
  //   return filteredPlaces;
  // }
}
