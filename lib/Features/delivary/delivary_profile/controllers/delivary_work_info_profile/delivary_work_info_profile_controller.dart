import 'package:express_corner/core/class/statusRequest.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/data/models/delivary_expertise_model.dart';
import '../../../../../core/data/models/delivary_type_vehicle_model.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';
import '../../../delivary_Layout/data/models/delivary_info_model.dart';
import '../../data/datasorce/remote/delivary_work_info_profile.dart';

abstract class DelivaryWorkInfoProfileController extends GetxController {
  initialData();
  getDelivaryWorkInfoData();
  getAllExpertiseData();
  getAllTypeVehicleData();
  typeVehicleOnSelected(val);
  expertiseOnSelected(val);
  goToEditDelivaryWorkInfoProfile();
}

class DelivaryWorkInfoProfileControllerImp
    extends DelivaryWorkInfoProfileController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  DelivaryWorkInfoProfileData delivaryWorkInfoProfileData =
      DelivaryWorkInfoProfileData(Get.find());
  List<DelivaryInfoModel> delivaryInfoData = [];
  List<DelivaryExpertiseModel> delivaryExpertiseModel = [];
  List<DelivaryTypeVehicleModel> delivaryTypeVehicleModel = [];

  List<DropdownMenuEntry<dynamic>> expertiseDropdownMenuEntries = [];
  TextEditingController expertiseController = TextEditingController();

  List<DropdownMenuEntry<dynamic>> typeVehicleDropdownMenuEntries = [];
  TextEditingController typeVehicleController = TextEditingController();
  String isWaitEditApprove = "0";
  String urlImageVichele = "none";
  String urlTempImageVichele = "none";
  String urlImageDelivaryId = "none";
  String urlTempImageDelivaryId = "none";
  String urlImageDrivingLicense = "none";
  String urlTempImageDrivingLicense = "none";

  List<DelivaryInfoModel> delivaryModel = [];

  @override
  initialData() async {
    getAllExpertiseData();
    getAllTypeVehicleData();
  }

  @override
  void onInit() {
    delivaryModel = Get.arguments["delivaryModel"];
    getDelivaryWorkInfoData();

    initialData();
    super.onInit();
  }

  @override
  getAllExpertiseData() async {
    delivaryExpertiseModel.clear();
    expertiseDropdownMenuEntries.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await delivaryWorkInfoProfileData.getAllDelivaryExpertiesData();
    debugPrint(
        '==================== Delivary Work Info Profile Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        delivaryExpertiseModel.addAll(
            responsedata.map((e) => DelivaryExpertiseModel.fromJson(e)));
        expertiseDropdownMenuEntries.addAll(delivaryExpertiseModel.map((e) =>
            DropdownMenuEntry(
                value: e.delivaryExpertiseId.toString(),
                label: e.delivaryExpertiseName.toString())));
        expertiseController.text =
            delivaryModel.first.delivaryProfileExpertise.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getAllTypeVehicleData() async {
    delivaryTypeVehicleModel.clear();
    typeVehicleDropdownMenuEntries.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await delivaryWorkInfoProfileData.getAllDelivaryTypeVehicleData();
    debugPrint(
        '==================== Delivary Work Info Profile Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        delivaryTypeVehicleModel.addAll(
            responsedata.map((e) => DelivaryTypeVehicleModel.fromJson(e)));

        typeVehicleDropdownMenuEntries.addAll(delivaryTypeVehicleModel.map(
            (e) => DropdownMenuEntry(
                value: e.delivaryTypeVehicleId.toString(),
                label: e.delivaryTypeVehicleName.toString())));
        typeVehicleController.text =
            delivaryModel.first.delivaryProfileTypeVichele.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  typeVehicleOnSelected(val) {
    debugPrint(val);
    debugPrint(typeVehicleController.text);
  }

  @override
  expertiseOnSelected(val) {
    debugPrint(val);
    debugPrint(expertiseController.text);
  }

  @override
  goToEditDelivaryWorkInfoProfile() {
    Get.toNamed(AppRoute.delivaryEditWorkInfoView, arguments: {
      "delivaryModel": delivaryInfoData,
      "expertiseDropdownMenuEntries": expertiseDropdownMenuEntries,
      "typeVehicleDropdownMenuEntries": typeVehicleDropdownMenuEntries,
      "expertiseController": expertiseController.text,
      "typeVehicleController": typeVehicleController.text,
    });
  }

  @override
  getDelivaryWorkInfoData() async {
    delivaryInfoData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await delivaryWorkInfoProfileData.getDelivaryWorkInfoData(
        deliveryid: myServices.sharedPreferences.getString("id").toString());
    debugPrint(
        '==================== Delivary Work Info Profile Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        delivaryInfoData
            .addAll(responseData.map((e) => DelivaryInfoModel.fromJson(e)));
        isWaitEditApprove =
            delivaryInfoData.first.delivaryProfileIsWaitEditApprove.toString();
        urlImageVichele =
            delivaryInfoData.first.delivaryProfileImageVichele.toString();
        urlTempImageVichele =
            delivaryInfoData.first.delivaryProfileTempImageVichele.toString();
        urlImageDelivaryId =
            delivaryInfoData.first.delivaryProfileImageDelivaryId.toString();
        urlTempImageDelivaryId = delivaryInfoData
            .first.delivaryProfileTempImageDelivaryId
            .toString();
        urlImageDrivingLicense = delivaryInfoData
            .first.delivaryProfileImageDrivingLicense
            .toString();
        urlTempImageDrivingLicense = delivaryInfoData
            .first.delivaryProfileTempImageDrivingLicense
            .toString();

        myServices.sharedPreferences
            .setString("username", delivaryInfoData.first.usersName.toString());
        myServices.sharedPreferences
            .setString("email", delivaryInfoData.first.usersEmail.toString());
        // myServices.sharedPreferences.setString("password", password.text);
        myServices.sharedPreferences
            .setString("gov", delivaryInfoData.first.usersGov.toString());
        myServices.sharedPreferences
            .setString("city", delivaryInfoData.first.usersCity.toString());
        myServices.sharedPreferences
            .setString("phone", delivaryInfoData.first.usersPhone.toString());
        myServices.sharedPreferences.setString(
            "userimage", delivaryInfoData.first.usersImage.toString());
        myServices.sharedPreferences.setString("delivaryStatusType",
            delivaryInfoData.first.delivaryStatus.toString());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
