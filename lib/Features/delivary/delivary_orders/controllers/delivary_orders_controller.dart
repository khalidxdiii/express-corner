import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/data/models/delivary_model.dart';
import '../../../../core/functions/defult_notification.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/services/services.dart';
import '../data/datasource/remote/delivary_orders_data.dart';
import '../data/models/delivary_accepted_orders_model.dart';
import '../data/models/delivary_orders_details_model.dart';
import '../data/models/delivary_reject_orders_model.dart';
import '../presintaion/widgets/delivary_orders_layout/delivary_orders_archive_list_view.dart';
import '../presintaion/widgets/delivary_orders_layout/delivary_orders_accepted_list_view.dart';
import '../presintaion/widgets/delivary_orders_layout/delivary_orders_pinding_list_view.dart';

abstract class DelivaryOrdersController extends GetxController {
  delivaryApproveOrder({required String orderid, required String usersid});
  delivaryPindingOrders();
  rejectPindingOrders({required String orderid});
  delivaryAcceptedOrders();
  delivaryArchiveOrders();
  delivaryRefreshOrders();
  checkDelivaryAcceptedOrdersApprove();
  choosePage(int val);
  onPageChanged(int index);
  intialData();
}

class DelivaryOrdersControllerImp extends DelivaryOrdersController {
  StatusRequest statusRequestPinding = StatusRequest.none;
  StatusRequest statusRequestCurrent = StatusRequest.none;
  StatusRequest statusRequestArchive = StatusRequest.none;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  DelivaryOrdersData ordersData = DelivaryOrdersData(Get.find());
  List<DelivaryOrdersDetailsModel> pindingDataOrders = [];
  List<DelivaryOrdersDetailsModel> acceptedDataOrders = [];
  List<DelivaryOrdersDetailsModel> archiveDataOrders = [];
  List<DelivaryAcceptedOrdersModel> delivaryApproveData = [];
  List<DelivaryModel> delivaryData = [];
  bool isAcceptedOrders = false;

  late PageController? pageController;
  int? currentPage = 0;
  List<Widget> pages = [
    const DelivaryOrdersPindingListView(),
    const DelivaryOrdersAcceptedListView(),
    const DelivaryOrdersArchiveListView(),
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
  delivaryApproveOrder(
      {required String orderid, required String usersid}) async {
    statusRequestPinding = StatusRequest.loading;
    update();
    var response = await ordersData.approveOrderData(
      deliveryid: myServices.sharedPreferences.getString("id")!,
      orderid: orderid,
      usersid: usersid,
    );
    debugPrint('==================== Delivary Orders Controller $response');
    statusRequestPinding = handlingData(response);
    if (StatusRequest.success == statusRequestPinding) {
      if (response['status'] == "success") {
        defultNotification(
          title: "تنبية",
          body: "تم الموافقة على الطلب رقم $orderid",
        );
        delivaryRefreshOrders();
      } else if (response['message'] ==
          "Order is already approved by another delivery man") {
        delivaryRefreshOrders();
        Get.defaultDialog(
          titleStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.primaryColor),
          title: "عملية مرفوضة",
          middleText: "هذا الطلب قد تم الموافقه عليه من قبل عامل توصيل اخر !!",
        );
        update();
      } else {
        statusRequestPinding = StatusRequest.delivaryEmptyOrders;
      }
    }
    update();
  }

  @override
  delivaryPindingOrders() async {
    if (isAcceptedOrders == false) {
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

  @override
  rejectPindingOrders({required String orderid}) async {
    // pindingDataOrders.clear();
    statusRequestPinding = StatusRequest.loading;
    update();
    var response = await ordersData.rejectPindingData(
        orderid: orderid,
        deliveryid: myServices.sharedPreferences.getString("id")!);
    debugPrint(
        '==================== Delivary reject Orders Pending Controller $response');
    statusRequestPinding = handlingData(response);
    if (StatusRequest.success == statusRequestPinding) {
      if (response['status'] == "success") {
        pindingDataOrders
            .removeWhere((element) => element.ordersId == int.parse(orderid));
        defultNotification(title: "عملية ناجحة", body: "تم رفض الطلب بنجاح");
        if (pindingDataOrders.isEmpty) {
          statusRequestPinding = StatusRequest.delivaryEmptyOrders;
          update();
        }
        // delivaryRefreshOrders();
      } else {
        statusRequestPinding = StatusRequest.delivaryEmptyOrders;
      }
    }
    update();
  }

  List<DelivaryRejectOrdersModel> rejectData = [];
  getAllRejectPindingOrders() async {
    // pindingDataOrders.clear();
    statusRequestPinding = StatusRequest.loading;
    update();
    var response = await ordersData.getAllRejectPindingData(
        deliveryid: myServices.sharedPreferences.getString("id")!);
    debugPrint(
        '==================== Delivary Get All reject Orders Pending Controller $response');
    statusRequestPinding = handlingData(response);
    if (StatusRequest.success == statusRequestPinding) {
      if (response['status'] == "success") {
        // List responsedata = response["data"];
        // rejectData.addAll(
        //     responsedata.map((e) => DelivaryRejectOrdersModel.fromJson(e)));
        List responseData = response["data"];
        rejectData.addAll(responseData
            .map((e) => DelivaryRejectOrdersModel.fromJson(e))
            .toList());
      } else {
        statusRequestPinding = StatusRequest.delivaryEmptyOrders;
      }
    }
    update();
  }

  @override
  delivaryRefreshOrders() async {
    pindingDataOrders.clear();
    acceptedDataOrders.clear();
    archiveDataOrders.clear();
    delivaryApproveData.clear();
    rejectData.clear();
    await checkDelivaryAcceptedOrdersApprove();
    await getAllRejectPindingOrders();
    delivaryPindingOrders();
    delivaryAcceptedOrders();
    delivaryArchiveOrders();
    update();
  }

  @override
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
  delivaryAcceptedOrders() async {
    acceptedDataOrders.clear();
    statusRequestCurrent = StatusRequest.loading;
    update();
    var response = await ordersData.acceptedOrdersData(
        deliveryid: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Delivary Orders Controller $response');
    statusRequestCurrent = handlingData(response);
    if (StatusRequest.success == statusRequestCurrent) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        acceptedDataOrders.addAll(
            responsedata.map((e) => DelivaryOrdersDetailsModel.fromJson(e)));
        acceptedDataOrders
            .sort((b, a) => a.ordersDatetime!.compareTo(b.ordersDatetime!));
        // getDelvaryData();
      } else {
        statusRequestCurrent = StatusRequest.delivaryEmptyOrders;
      }
    }

    update();
  }

  @override
  intialData() async {
    await checkDelivaryAcceptedOrdersApprove();
    await getAllRejectPindingOrders();
    delivaryPindingOrders();
    delivaryAcceptedOrders();
    delivaryArchiveOrders();
  }

  @override
  void onInit() {
    pageController = PageController();

    intialData();
    super.onInit();
  }

  @override
  checkDelivaryAcceptedOrdersApprove() async {
    delivaryApproveData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getDelivaryAcceptedOrdersApproveData(
        deliveryid: myServices.sharedPreferences.getString("id")!);
    debugPrint(
        '==================== Delivary Orders accepted data Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        delivaryApproveData.addAll(
            responsedata.map((e) => DelivaryAcceptedOrdersModel.fromJson(e)));
        if (delivaryApproveData.first.delivaryAcceptedOrdersDelivaryApprove ==
            "1") {
          isAcceptedOrders = true;
          update();
        } else {
          isAcceptedOrders = false;
          update();
        }
      } else {
        statusRequest = StatusRequest.delivaryEmptyOrders;
      }
    }
    update();
  }
}
