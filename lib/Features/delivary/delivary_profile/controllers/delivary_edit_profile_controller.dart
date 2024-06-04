import 'dart:io';

import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/controller/gov_city_controller.dart';
import '../../../../core/functions/handlingdata.dart';
import '../../../../core/functions/upload_file.dart';
import '../../delivary_Layout/data/models/delivary_info_model.dart';
import '../data/datasorce/remote/profile_data.dart';
import 'delivary_profile_controller.dart';

abstract class EditProfileController extends GetxController {
  edit();
  view();
}

class DelivaryEditProfileControllerImp extends GovCityControllerImp {
  late GlobalKey<FormState> key;
  late TextEditingController username;
  late TextEditingController email;
  // late TextEditingController password;

  late TextEditingController phone;
  late String image;

  List<DelivaryInfoModel> delivaryModel = [];
  DelivaryInfoModel? delivaryDataInfo;
  MyServices myServices = Get.find();

  DelivaryProfileData profileData = DelivaryProfileData(Get.find());

  File? file;

  showOpitionImage() {
    showBottomMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(isSvg: false);
    update();
  }

  // bool isShowPassword = true;
  // showPassword() {
  //   isShowPassword = !isShowPassword;
  //   update();
  // }

  view() async {
    delivaryModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.viewData(
        usersid: myServices.sharedPreferences.getString("id").toString());
    debugPrint('==================== Profile Edit View Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        delivaryModel
            .addAll(datalist.map((e) => DelivaryInfoModel.fromJson(e)));
        if (delivaryModel.isNotEmpty) {
          delivaryDataInfo =
              delivaryModel.first; // Extract the first user model from the list
          // Assign values to TextEditingController instances
          username.text = delivaryDataInfo!.usersName!;
          email.text = delivaryDataInfo!.usersEmail!;
          // password.text = delivaryDataInfo!.usersPassword!;
          govName.text = delivaryDataInfo!.usersGov!;
          cityName.text = delivaryDataInfo!.usersCity!;
          phone.text = delivaryDataInfo!.usersPhone!;
          image = delivaryDataInfo!.usersImage.toString();

          // Assign other values similarly...
          myServices.sharedPreferences.setString("username", username.text);
          myServices.sharedPreferences.setString("email", email.text);
          // myServices.sharedPreferences.setString("password", password.text);
          myServices.sharedPreferences.setString("gov", govName.text);
          myServices.sharedPreferences.setString("city", cityName.text);
          myServices.sharedPreferences.setString("phone", phone.text);
          myServices.sharedPreferences.setString("userimage", image);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  edit() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "id": delivaryDataInfo!.usersId.toString(),
        "username": username.text,
        "email": email.text,
        // "password": password.text,
        "phone": phone.text,
        "gov": govName.text,
        "city": cityName.text,
        "imageold": delivaryDataInfo!.usersImage,

        // "datenow": DateTime.now().toString()
      };

      // var response = await profileData.editData(data: data, file: file);
      var response =
          await profileData.delivaryEditProfileData(data: data, file: file);
      debugPrint('==================== profile Edit Controller $response');
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // Get.offNamed(AppRoute.itemsView);
          myServices.sharedPreferences.setString("username", username.text);
          myServices.sharedPreferences.setString("email", email.text);
          // myServices.sharedPreferences.setString("password", password.text);
          myServices.sharedPreferences.setString("gov", govName.text);
          myServices.sharedPreferences.setString("city", cityName.text);
          myServices.sharedPreferences.setString("phone", phone.text);
          myServices.sharedPreferences
              .setString("userimage", delivaryDataInfo!.usersImage.toString());
          DelivaryEditProfileControllerImp c = Get.find();
          c.view();
          Get.delete<DelivaryProfileControllerImp>();

          // HomeControllerImp c2 = Get.put(HomeControllerImp());
          // // c2.view();
          // Get.delete<HomeControllerImp>();

          Get.snackbar(
            "تنبيه",
            "تم حفظ التغييرات بنجاح",
            backgroundColor: AppColor.fithColor,
            colorText: AppColor.primaryColor,
          );
        } else {
          Get.snackbar(
            "تنبيه",
            "لم تقم بحفظ نعديلات جديدة",
            backgroundColor: AppColor.fithColor,
            colorText: AppColor.primaryColor,
          );
          // statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
    update();
  }

  intialDataUser() {
    username.text =
        myServices.sharedPreferences.getString("username").toString();
    image = myServices.sharedPreferences.getString("userimage").toString();
    email.text = myServices.sharedPreferences.getString("email").toString();
    // password.text =
    //     myServices.sharedPreferences.getString("password").toString();
    govName.text = myServices.sharedPreferences.getString("gov").toString();
    cityName.text = myServices.sharedPreferences.getString("city").toString();

    phone.text = myServices.sharedPreferences.getString("phone").toString();
    update();
  }

  @override
  void onInit() {
    //  EditProfileControllerImp c = Get.find();

    // Get.delete<HomeControllerImp>();
    delivaryModel = Get.arguments['delivaryModel'];

    key = GlobalKey<FormState>();
    username = TextEditingController();
    email = TextEditingController();
    // password = TextEditingController();
    govName = TextEditingController();
    cityName = TextEditingController();
    phone = TextEditingController();
    // userModel?.usersImage == "empty";
    view();
    // username.text = usersData.usersName!;
    intialDataUser();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    // password.dispose();

    phone.dispose();
    super.dispose();
  }
}
