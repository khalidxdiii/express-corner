import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';
import '../../../delivary_orders/presintaion/views/delivary_orders_layout_view.dart';
import '../../../delivary_profile/presentation/views/delivary_profile_view.dart';
import '../../data/datasorce/remote/delivary_home_data.dart';
import '../../data/models/delivary_info_model.dart';

abstract class DelivaryHomeController extends GetxController {
  changePage(int newIndex);
  delivaryApproveOrder();
}

class DelivaryHomeControllerImp extends DelivaryHomeController {
  int currentIndex = 0;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  DelivaryHomeDataData delivaryHomeDataData = DelivaryHomeDataData(Get.find());
  List<DelivaryInfoModel> delivaryInfoData = [];
  String delivaryStatusType = "available";
  String username = "";
  String email = "";
  String phone = "";
  String image = "";
  String govName = "";
  String cityName = "";

  List<Widget> body = const [
    Icon(Icons.home),
    DelivaryOrdersLayoutView(),
    DelivaryProfileView(),
  ];

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      label: "الرئيسية",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "الطلبات",
      icon: Icon(Icons.check_outlined),
    ),
    BottomNavigationBarItem(
      label: "حسابى",
      icon: Icon(
        Icons.person,
      ),
    ),
  ];

  @override
  changePage(int newIndex) {
    currentIndex = newIndex;
    update();
  }

  @override
  delivaryApproveOrder() async {
    delivaryInfoData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await delivaryHomeDataData.getDelivaryInfo(
      deliveryid: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint(
        '==================== Delivary Home Layout Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        delivaryInfoData
            .addAll(responseData.map((e) => DelivaryInfoModel.fromJson(e)));
        delivaryStatusType = delivaryInfoData.first.delivaryStatus.toString();
        username = delivaryInfoData.first.usersName.toString();
        email = delivaryInfoData.first.usersEmail.toString();
        phone = delivaryInfoData.first.usersPhone.toString();
        image = delivaryInfoData.first.usersImage.toString();
        govName = delivaryInfoData.first.usersGov.toString();
        cityName = delivaryInfoData.first.usersCity.toString();

        myServices.sharedPreferences.setString("username", username);
        myServices.sharedPreferences.setString("email", email);
        // myServices.sharedPreferences.setString("password", password.text);
        myServices.sharedPreferences.setString("gov", govName);
        myServices.sharedPreferences.setString("city", cityName);
        myServices.sharedPreferences.setString("phone", phone);
        myServices.sharedPreferences.setString("userimage", image);
        myServices.sharedPreferences
            .setString("delivaryStatusType", delivaryStatusType);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initalData() async {
    await delivaryApproveOrder();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
