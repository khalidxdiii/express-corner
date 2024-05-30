import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/approutes.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/data/models/delivary_expertise_model.dart';
import '../../../../core/data/models/delivary_type_vehicle_model.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/functions/upload_file.dart';
import '../../../../core/services/services.dart';
import '../../../delivary/delivary_profile/data/datasorce/remote/delivary_work_info_profile.dart';

abstract class WorkAsDelivaryController extends GetxController {
  goToLocationAccess();
  // showOpitionImage();
}

class WorkAsDelivaryControllerImp extends WorkAsDelivaryController {
  late String userType;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  DelivaryWorkInfoProfileData delivaryWorkInfoProfileData =
      DelivaryWorkInfoProfileData(Get.find());
  List<DelivaryExpertiseModel> delivaryExpertiseModel = [];
  List<DelivaryTypeVehicleModel> delivaryTypeVehicleModel = [];

  List<DropdownMenuEntry<dynamic>> expertiseDropdownMenuEntries = [];
  TextEditingController expertiseController = TextEditingController();

  List<DropdownMenuEntry<dynamic>> typeVehicleDropdownMenuEntries = [];
  TextEditingController typeVehicleController = TextEditingController();

  @override
  goToLocationAccess() {
    if (typeVehicleController.text == "" ||
        expertiseController.text == "" ||
        fileImageTypeVichele == null ||
        fileImageDelivaryId == null ||
        fileImageDrivingLicense == null) {
      Get.defaultDialog(
        title: "تنبية",
        middleText: "برجاء تعبئة جميع الحقول المطلوبة",
        textConfirm: "موافق",
        buttonColor: AppColor.primaryColor,
        confirmTextColor: Colors.white,
        titleStyle: const TextStyle(
            color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        onConfirm: () {
          Get.back(); // Close the dialog
        },
      );
    } else {
      Get.toNamed(AppRoute.locationAccess, arguments: {
        "userType": userType,
        "typeVichele": typeVehicleController.text,
        "expertise": expertiseController.text,
        "imageVichele": fileImageTypeVichele,
        "imageDelivaryId": fileImageDelivaryId,
        "imageDrivingLicense": fileImageDrivingLicense,
      });
    }
  }

  @override
  void onInit() {
    userType = Get.arguments["userType"];
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    await getAllExpertiseData();
    await getAllTypeVehicleData();
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

  // image section
  File? fileImageTypeVichele;

  showOpitionImageVehicle() {
    showBottomMenu(chooseImagevehicleCamera, chooseImageVehicleGallery);
  }

  chooseImagevehicleCamera() async {
    fileImageTypeVichele = await imageUploadCamera();
    update();
  }

  chooseImageVehicleGallery() async {
    fileImageTypeVichele = await fileUploadGallery(isSvg: false);
    update();
  }

  deleteImageVehicle() {
    fileImageTypeVichele = null;
    update();
  }

  File? fileImageDelivaryId;
  showOpitionImageDelivaryId() {
    showBottomMenu(chooseImageDelivaryIdCamera, chooseImageDelivaryIdGallery);
  }

  chooseImageDelivaryIdCamera() async {
    fileImageDelivaryId = await imageUploadCamera();
    update();
  }

  chooseImageDelivaryIdGallery() async {
    fileImageDelivaryId = await fileUploadGallery(isSvg: false);
    update();
  }

  deleteImageDelivaryId() {
    fileImageDelivaryId = null;
    update();
  }

  File? fileImageDrivingLicense;
  showOpitionImageDrivingLicense() {
    showBottomMenu(
        chooseImageDrivingLicenseCamera, chooseImageDrivingLicenseGallery);
  }

  chooseImageDrivingLicenseCamera() async {
    fileImageDrivingLicense = await imageUploadCamera();
    update();
  }

  chooseImageDrivingLicenseGallery() async {
    fileImageDrivingLicense = await fileUploadGallery(isSvg: false);
    update();
  }

  deleteImageDrivingLicense() {
    fileImageDrivingLicense = null;
    update();
  }

// end image section
}
