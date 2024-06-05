import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../../../core/class/statusRequest.dart';
// import '../../../../core/services/services.dart';
import '../../../../core/class/statusRequest.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../delivary_Layout/presentation/controllers/delivary_home_layout_controller.dart';
import '../../delivary_orders/data/datasource/remote/delivary_orders_data.dart';
import '../../delivary_orders/data/models/delivary_orders_details_model.dart';
import '../../delivary_orders/data/models/delivary_reject_orders_model.dart';
import '../data/datasource/delivary_home_page_data.dart';

abstract class DelivaryHomePageController
    extends DelivaryHomeLayoutControllerImp {}

class DelivaryHomePageControllerImp extends DelivaryHomePageController {
  // MyServices myServices = Get.find();
  // StatusRequest statusRequest = StatusRequest.none;
  DelivaryHomePageData homeData = DelivaryHomePageData(Get.find());
  List<DelivaryOrdersDetailsModel> pindingDataOrders = [];
  List<DelivaryOrdersDetailsModel> archiveDataOrders = [];
  StatusRequest statusRequestPinding = StatusRequest.none;
  StatusRequest statusRequestArchive = StatusRequest.none;
  List<DelivaryRejectOrdersModel> rejectData = [];
  DelivaryOrdersData ordersData = DelivaryOrdersData(Get.find());

  delivaryPindingOrders() async {
    // if (isAcceptedOrders == false) {
    if ("1" == "1") {
      pindingDataOrders.clear();
      statusRequestPinding = StatusRequest.loading;
      update();
      var response = await ordersData.pindingData();
      debugPrint('==================== Delivary Orders Controller $response');
      statusRequestPinding = handlingData(response);
      if (StatusRequest.success == statusRequestPinding) {
        if (response['status'] == "success") {
          List responseData = response["data"];
          pindingDataOrders.addAll(responseData
              .map((e) => DelivaryOrdersDetailsModel.fromJson(e))
              .toList());

          // Removing orders from pindingDataOrders that exist in rejectData by orderId

          pindingDataOrders.removeWhere((pendingOrder) => rejectData.any(
              (rejectOrder) =>
                  rejectOrder.rejectOrdersOrderId == pendingOrder.ordersId));

          if (pindingDataOrders.isEmpty) {
            statusRequestPinding = StatusRequest.delivaryEmptyOrders;
            update();
          }

          // Sorting pindingDataOrders
          pindingDataOrders
              .sort((b, a) => a.ordersDatetime!.compareTo(b.ordersDatetime!));
        } else {
          statusRequestPinding = StatusRequest.delivaryEmptyOrders;
        }
      }
    } else {
      statusRequestPinding = StatusRequest.delivaryMustCompleteOrders;
    }

    update();
  }

  delivaryArchiveOrders() async {
    archiveDataOrders.clear();
    statusRequestArchive = StatusRequest.loading;
    update();
    var response = await ordersData.archiveData(
        deliveryid: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Delivary Orders Controller $response');
    statusRequestArchive = handlingData(response);
    if (StatusRequest.success == statusRequestArchive) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        archiveDataOrders.addAll(
            responsedata.map((e) => DelivaryOrdersDetailsModel.fromJson(e)));

        archiveDataOrders
            .sort((b, a) => a.ordersDatetime!.compareTo(b.ordersDatetime!));
      } else {
        statusRequestArchive = StatusRequest.delivaryEmptyOrders;
      }
    }
    update();
  }

  @override
  void onInit() {
    delivaryPindingOrders();
    delivaryArchiveOrders();
    super.onInit();
  }
}
