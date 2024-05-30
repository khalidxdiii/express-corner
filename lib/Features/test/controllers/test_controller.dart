import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_webservice/geocoding.dart';

import '../../../core/utils/utils.dart';

class TestController extends GetxController {
  final GoogleMapsPlaces _places = GoogleMapsPlaces(
    apiKey: Utils.googleMapsPlacesApiKey,
  );

  final String _googleTranslateApiKey = Utils.googleTranslateApiKey;

  final RxList<PlacesSearchResult> placesList = <PlacesSearchResult>[].obs;

  @override
  void onInit() {
    _fetchPlaces();
    super.onInit();
  }

  Future<void> _fetchPlaces() async {
    try {
      final PlacesSearchResponse placesResponse =
          await _places.searchNearbyWithRadius(
        Location(lat: 30.959479, lng: 31.239124),
        1500,
        type: 'restaurant',
      );
      if (placesResponse.isOkay) {
        placesList.assignAll(placesResponse.results);
      }
    } catch (e) {
      print('Error fetching places: $e');
    }
  }

  Future<String?> getCityName(Location location) async {
    final places = GoogleMapsGeocoding(
      apiKey: Utils.googleMapsPlacesApiKey,
    );
    try {
      final GeocodingResponse response =
          await places.searchByLocation(location);
      if (response.isOkay) {
        String formattedAddress = response.results.first.formattedAddress!;
        List<String> addressParts = formattedAddress.split(',');
        String cityName = addressParts.length >= 3
            ? addressParts[1].trim()
            : formattedAddress;
        return _translateText(cityName, 'en', 'ar');
      }
    } catch (e) {
      print('Error fetching city name: $e');
    }
    return null;
  }

  Future<String> _translateText(
      String text, String sourceLanguage, String targetLanguage) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://translation.googleapis.com/language/translate/v2?key=$_googleTranslateApiKey&q=$text&source=$sourceLanguage&target=$targetLanguage'),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data['data']['translations'][0]['translatedText'];
      } else {
        throw Exception('Failed to translate text');
      }
    } catch (e) {
      print('Error translating text: $e');
      throw Exception('Failed to translate text');
    }
  }
}
