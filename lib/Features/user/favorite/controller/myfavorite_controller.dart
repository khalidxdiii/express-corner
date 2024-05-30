import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/services.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../data/models/myfavorite.dart';

class MYFavoriteController extends GetxController {
  MyFavoriteDate myFavoriteData = MyFavoriteDate(Get.find());

  List<MyFavoriteModel> dataMyFav = [];

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();


  // key => id items
  // value => 1 or 0

  getMyFavData() async {
    dataMyFav.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(
      usersId: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint('==================== MyFavorite Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List responseData = response['data'];
        dataMyFav.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print(" ========= data ========");
        print(dataMyFav);
      } else {
        statusRequest = StatusRequest.emptyFavorite;
      }
    }
    update();
  }

  deleteMyFavorite({required String favoriteId}) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = myFavoriteData.deleteData(favId: favoriteId);
    debugPrint('==================== MyFavorite Controller $response');
    dataMyFav.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  



  @override
  void onInit() {
    getMyFavData();
    super.onInit();
  }
}
