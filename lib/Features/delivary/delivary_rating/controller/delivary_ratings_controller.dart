import 'package:express_corner/core/class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/services.dart';
import '../data/datasource/remote/delivary_ratings_data.dart';
import '../data/models/delivary_ratings_model.dart';

abstract class DelivaryRatingsController extends GetxController {
  getAllratings();
}

class DelivaryRatingsControllerImp extends DelivaryRatingsController {
  StatusRequest statusRequest = StatusRequest.none;
  late String? averageRating;
  late String? totalRatings;
  late String? userImage;
  MyServices myServices = Get.find();
  DelivaryRatingsData delivaryRatingsData = DelivaryRatingsData(Get.find());
  List<DelivaryRatingsModel> delivaryRatingsModel = [];

  @override
  void onInit() {
    averageRating = Get.arguments["averageRating"];
    totalRatings = Get.arguments["totalRatings"];
    getAllratings();
    super.onInit();
  }

  @override
  getAllratings() async {
    delivaryRatingsModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await delivaryRatingsData.getAllDelivaryRatings(
      deliveryid: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint(
        '==================== Delivary Home Layout Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        delivaryRatingsModel
            .addAll(responseData.map((e) => DelivaryRatingsModel.fromJson(e)));
        userImage = delivaryRatingsModel.first.userImage.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
