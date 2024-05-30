import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/data/models/delivary_model.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/services.dart';
import '../data/datasource/remote/orders_data.dart';
import '../data/models/current_orders_withdelivary_model.dart';
import '../presintaion/widgets/orders_layout/orders_archive_list_view.dart';
import '../presintaion/widgets/orders_layout/orders_current_list_view.dart';
import '../presintaion/widgets/orders_layout/orders_pinding_list_view.dart';

abstract class OrdersController extends GetxController {
  pindingOrders();
  deletePindingOrders({required String orderid});
  curruntOrders();
  archiveOrders();
  refreshOrders();
  choosePage(int val);
  onPageChanged(int index);
  intialData();
}

class OrdersControllerImp extends OrdersController {
  StatusRequest statusRequestPinding = StatusRequest.none;
  StatusRequest statusRequestCurrent = StatusRequest.none;
  StatusRequest statusRequestArchive = StatusRequest.none;
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  List<OrdersWithDelivaryModel> pindingDataOrders = [];
  List<OrdersWithDelivaryModel> currentDataOrders = [];
  List<OrdersWithDelivaryModel> archiveDataOrders = [];
  List<DelivaryModel> delivaryData = [];

  late PageController? pageController;
  int? currentPage = 0;
  List<Widget> pages = [
    const OrdersPindingListView(),
    const OrdersCurrentListView(),
    const OrdersArchiveListView(),
  ];

  @override
  choosePage(int val) {
    currentPage = val;

    update();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  pindingOrders() async {
    pindingDataOrders.clear();
    statusRequestPinding = StatusRequest.loading;
    update();
    var response = await ordersData.pindingData(
        usersID: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Orders Controller $response');
    statusRequestPinding = handlingData(response);
    if (StatusRequest.success == statusRequestPinding) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        pindingDataOrders.addAll(
            responsedata.map((e) => OrdersWithDelivaryModel.fromJson(e)));

        pindingDataOrders
            .sort((b, a) => a.ordersDatetime!.compareTo(b.ordersDatetime!));
      } else {
        statusRequestPinding = StatusRequest.emptyOrders;
      }
    }
    update();
  }

  @override
  deletePindingOrders({required String orderid}) async {
    pindingDataOrders.clear();
    statusRequestPinding = StatusRequest.loading;
    update();
    var response = await ordersData.deletePindingData(orderID: orderid);
    debugPrint('==================== Orders Pending Controller $response');
    statusRequestPinding = handlingData(response);
    if (StatusRequest.success == statusRequestPinding) {
      if (response['status'] == "success") {
        refreshOrders();
      } else {
        statusRequestPinding = StatusRequest.emptyOrders;
      }
    }
    update();
  }

  @override
  refreshOrders() async {
    pindingDataOrders.clear();
    currentDataOrders.clear();
    archiveDataOrders.clear();
    await pindingOrders();
    await curruntOrders();
    await archiveOrders();
    update();
  }

  @override
  archiveOrders() async {
    archiveDataOrders.clear();
    statusRequestArchive = StatusRequest.loading;
    update();
    var response = await ordersData.archiveData(
        usersID: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Orders Controller $response');
    statusRequestArchive = handlingData(response);
    if (StatusRequest.success == statusRequestArchive) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        archiveDataOrders.addAll(
            responsedata.map((e) => OrdersWithDelivaryModel.fromJson(e)));

        archiveDataOrders
            .sort((b, a) => a.ordersDatetime!.compareTo(b.ordersDatetime!));
      } else {
        statusRequestArchive = StatusRequest.emptyOrders;
      }
    }
    update();
  }

  @override
  curruntOrders() async {
    currentDataOrders.clear();
    statusRequestCurrent = StatusRequest.loading;
    update();
    var response = await ordersData.currentOrdersData(
        usersID: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Orders Controller $response');
    statusRequestCurrent = handlingData(response);
    if (StatusRequest.success == statusRequestCurrent) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        currentDataOrders.addAll(
            responsedata.map((e) => OrdersWithDelivaryModel.fromJson(e)));
        currentDataOrders
            .sort((b, a) => a.ordersDatetime!.compareTo(b.ordersDatetime!));
        // getDelvaryData();
      } else {
        statusRequestCurrent = StatusRequest.emptyOrders;
      }
    }
    update();
  }

  @override
  intialData() {
    pindingOrders();
    curruntOrders();
    archiveOrders();
  }

  @override
  void onInit() {
    
    pageController = PageController();
    intialData();
    super.onInit();
  }
}
