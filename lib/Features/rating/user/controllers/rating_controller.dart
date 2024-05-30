import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/handlingdata.dart';
import '../data/datasorce/remote/rating_data.dart';

abstract class RatingController extends GetxController {
  onRatingUpdate(double val);
  addRating();
}

class RatingControllerImp extends RatingController {
  StatusRequest statusRequest = StatusRequest.none;
  RatingData ratingData = RatingData(Get.find());
  late TextEditingController comment;
  String userComment = "";
  double rating = 0.0;
  late String orderId;
  late String delivaryid;
  MyServices myServices = Get.find();

  @override
  onRatingUpdate(double val) {
    rating = val;
  }

  @override
  addRating() async {
    if (comment.text != "") {
      userComment = comment.text;
    } else {
      userComment = "لا يوجد ملاحظات";
    }
    if (rating != 0.0) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await ratingData.addUserRating(
        ordersID: orderId,
        userid: myServices.sharedPreferences.getString("id")!,
        delivaryid: delivaryid,
        rating: rating.toString(),
        comment: userComment,
      );
      debugPrint('==================== Orders Controller $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.homeLayoutView);
          Get.snackbar(
            "تنبية",
            "تم حفظ تقيمك بنجاح",
            backgroundColor: AppColor.fithColor,
            colorText: AppColor.primaryColor,
          );
        } else {
          statusRequest = StatusRequest.emptyOrders;
        }
      }
    } else {
      Get.snackbar(
        "تنبية",
        "برجاء تقييم الخدمة اولا!",
        backgroundColor: AppColor.fithColor,
        colorText: AppColor.primaryColor,
      );
    }

    update();
  }

  @override
  void onInit() {
    orderId = Get.arguments["orderId"];
    delivaryid = Get.arguments["delivaryid"];
    comment = TextEditingController();
    super.onInit();
  }
}
