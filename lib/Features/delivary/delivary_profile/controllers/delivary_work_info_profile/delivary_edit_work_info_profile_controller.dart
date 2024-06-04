import 'dart:io';

import 'package:express_corner/core/class/statusRequest.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/data/models/delivary_expertise_model.dart';
import '../../../../../core/data/models/delivary_type_vehicle_model.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/functions/upload_file.dart';
import '../../../../../core/services/services.dart';
import '../../../delivary_Layout/data/models/delivary_info_model.dart';
import '../../data/datasorce/remote/delivary_work_info_profile.dart';

abstract class DelivaryEditWorkInfoProfileController extends GetxController {
  saveEditData();
  typeVehicleOnSelected(val);
  expertiseOnSelected(val);
}

class DelivaryEditWorkInfoProfileControllerImp
    extends DelivaryEditWorkInfoProfileController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late List<DelivaryInfoModel> delivaryModel;
  DelivaryWorkInfoProfileData delivaryWorkInfoProfileData =
      DelivaryWorkInfoProfileData(Get.find());
  List<DelivaryExpertiseModel> delivaryExpertiseModel = [];
  List<DelivaryTypeVehicleModel> delivaryTypeVehicleModel = [];

  late List<DropdownMenuEntry<dynamic>> expertiseDropdownMenuEntries;
  TextEditingController expertiseController = TextEditingController();

  late List<DropdownMenuEntry<dynamic>> typeVehicleDropdownMenuEntries;
  TextEditingController typeVehicleController = TextEditingController();

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

  @override
  void onInit() {
    delivaryModel = Get.arguments["delivaryModel"];
    expertiseDropdownMenuEntries =
        Get.arguments["expertiseDropdownMenuEntries"];
    typeVehicleDropdownMenuEntries =
        Get.arguments["typeVehicleDropdownMenuEntries"];
    expertiseController.text = Get.arguments["expertiseController"];
    typeVehicleController.text = Get.arguments["typeVehicleController"];
    super.onInit();
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
  saveEditData() async {
    if (typeVehicleController.text == "" || expertiseController.text == ""
        // ||
        // fileImageTypeVichele == null ||
        // fileImageDelivaryId == null ||
        // fileImageDrivingLicense == null
        ) {
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
      statusRequest = StatusRequest.loading;
      update();

      var response = await delivaryWorkInfoProfileData.delivaryEditProfileData(
        delivaryId: myServices.sharedPreferences.getString("id").toString(),
        typeVichele: typeVehicleController.text,
        expertise: expertiseController.text,
        imageVichele: fileImageTypeVichele,
        imageDelivaryId: fileImageDelivaryId,
        imageDrivingLicense: fileImageDrivingLicense,
      );

      debugPrint(
          '==================== Delivary Edit Work Info Profile Cotroller  : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.defaultDialog(
            title: "عملية ناجحه",
            middleText: "سيتم مراجعه طلبكم خلال 48 ساعه",
            textConfirm: "موافق",
            buttonColor: AppColor.primaryColor,
            confirmTextColor: Colors.white,
            titleStyle: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            onConfirm: () {
              // Get.back();
              Get.offAllNamed(AppRoute.delivaryHomeLayoutView);
            },
          );
        } else {
          Get.defaultDialog(title: "تنبية", middleText: "حاول مره اخرى");
          statusRequest = StatusRequest.failure;
        }
      }
    }

    update();
  }
}
