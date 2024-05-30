import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/data/models/place_details_model/place_details_model.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/google_maps_places_services.dart';
import '../../../../core/services/services.dart';

import '../../home page/controllers/home_page_controller.dart';
import '../data/datasource/remote/favorite_dara.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../data/models/myfavorite.dart';

class FavoriteController extends HomePageController {
  // FavoriteData favoriteDAta = FavoriteData(Get.find());
  // List data = [];

  // StatusRequest statusRequest = StatusRequest.none;
  // MyServices myServices = Get.find();
  // MyFavoriteDate myFavoriteData = MyFavoriteDate(Get.find());
  // GoogleMapsPlacesService googleMapsPlacesService = GoogleMapsPlacesService();

  // RxList<String> favoritePlaceIds = <String>[].obs;
  // List<String> favoritePlaceIds = [];

  // Future<List<String>> getFavHomeData() async {
  //   // List to hold the favorite placeIds

  //   try {
  //     // Assuming myServices.sharedPreferences.getString("id")! successfully retrieves the user ID
  //     var response = await myFavoriteData.getData(
  //       usersId: myServices.sharedPreferences.getString("id")!,
  //     );
  //     debugPrint('==================== MyFavorite Controller $response');

  //     // Check if the request was successful and the response contains data
  //     if (response['status'] == "success") {
  //       favoritePlaceIds.clear();
  //       List responseData = response['data'];

  //       // Convert each item in the responseData to a MyFavoriteModel and extract the placeId
  //       favoritePlaceIds.addAll(responseData.map(
  //           (e) => MyFavoriteModel.fromJson(e).favoritePlaceid.toString()));

  //       print(" ========= data ========");
  //       print(favoritePlaceIds);
  //     } else {
  //       // Optionally handle failure or invalid status
  //       print("Failed to fetch favorites: ${response['message']}");
  //     }
  //   } catch (e) {
  //     // Handle any exceptions during the request or parsing
  //     print('Exception occurred while fetching favorites: $e');
  //   }

  //   // Always return the list of favoritePlaceIds, which may be empty if there were errors
  //   return favoritePlaceIds;
  // }

  // addFavorite({required String placeid, required String type}) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await favoriteDAta.addFavorite(
  //     usersId: myServices.sharedPreferences.getString("id")!,
  //     placeid: placeid,
  //     type: type,
  //   );
  //   debugPrint('==================== favorite Controller $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       // data.addAll(response['data']);
  //       // favoritePlaceIds.add(placeid);
  //       favoritePlaceIds.add(placeid);
  //       Get.rawSnackbar(
  //           title: "اشعار",
  //           messageText: const Text("تم اضافه المنتج الى المفضله"));

  //       // Get.find<HomeControllerImp>().update();
  //       update();
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  // removeFavorite({required String placeid}) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await favoriteDAta.deleteFavorite(
  //       usersId: myServices.sharedPreferences.getString("id")!,
  //       placeid: placeid);
  //   debugPrint('==================== favorite Controller $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       // data.addAll(response['data']);
  //       favoritePlaceIds.removeWhere((element) => element == placeid);
  //       data.removeWhere((element) => element.favoritePlaceid == placeid);

  //       favoritePlaceIds.remove(placeid);
  //       Get.rawSnackbar(
  //           title: "اشعار",
  //           messageText: const Text("تم حذف المنتج من المفضله"));
  //       update();
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }

  //   update();
  // }

  getMyFavData() async {
    data.clear();

    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(
      usersId: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint('==================== MyFavorite Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print(" ========= data ========");

        var details = <PlaceDetailsModel>[];
        for (var placeId in data.map((e) => e.favoritePlaceid)) {
          // for (var placeId in favoritePlaceIds) {
          var placeDetail = await googleMapsPlacesService.getPlaceDetails(
              placeId: placeId.toString());
          details.add(placeDetail);
          print('Place details: $placeDetail');
        }

        final List<dynamic> favoritesFromServer = response['data'];
        favorites.clear();
        favorites.addAll(
            favoritesFromServer.map((placeId) => placeId.toString()).toList());
        placesDetails.value = details;
      } else {
        statusRequest = StatusRequest.emptyFavorite;
      }
    }
    update();
  }

  removeFromMyFavorite({required String placeid}) async {
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
        placesDetails.removeWhere((element) => element.placeId == placeid);

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

  // var placesDetails = <PlaceDetailsModel>[].obs;

  @override
  void onInit() {
    getMyFavData();

    super.onInit();
  }

  // @override
  void refreshScreen() async {
    statusRequest = StatusRequest.loading;
    await getMyFavData();
    statusRequest = StatusRequest.none;
  }

  var favorites = <String>[].obs;

  void refreshUI() {
    favoritePlaceIds.value;
    update();
  }
}
