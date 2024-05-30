import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../class/statusRequest.dart';
import '../data/datasorce/remote/gov_city_data/gov_city_data.dart';
import '../data/models/city_model.dart';
import '../data/models/gender_model.dart';
import '../data/models/gov_model.dart';
import '../functions/handlingdata.dart';

abstract class GovCityController extends GetxController {
  getGovs();
  getCity({required String govId});
  getGender();
  intialData();
  refreshPage();
  selectGovAndShowCity({required String selectedValue});
}

class GovCityControllerImp extends GovCityController {
  GovCityData govCityData = GovCityData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController govName;
  late TextEditingController govId;
  late TextEditingController cityName;
  late TextEditingController cityId;
  late TextEditingController genderName;
  late TextEditingController genderId;

  List<SelectedListItem> govDropDownList = [];
  List<SelectedListItem> cityDropDownList = [];
  List<SelectedListItem> genderDropDownList = [];

  List<GovModel> govData = [];
  List<CityModel> cityData = [];
  List<GenderModel> genderData = [];
  bool isDisabledCity = true;

  @override
  getGovs() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await govCityData.govView();
    debugPrint('==================== Items Add Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        govData.addAll(datalist.map((e) => GovModel.fromJson(e)));

        for (var i = 0; i < govData.length; i++) {
          govDropDownList.add(SelectedListItem(
              name: govData[i].governmentName!,
              value: govData[i].governmentId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getCity({required String govId}) async {
    statusRequest = StatusRequest.loading;
    cityData.clear();

    cityDropDownList.clear();
    update();
    var response = await govCityData.cityView(govId: govId);
    debugPrint('==================== Items Add Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        cityDropDownList.clear();
        List datalist = response['data'];
        cityData.addAll(datalist.map((e) => CityModel.fromJson(e)));

        for (var i = 0; i < cityData.length; i++) {
          cityDropDownList.add(SelectedListItem(
              name: cityData[i].cityName!,
              value: cityData[i].governmentId.toString()));
        }

        isDisabledCity = false;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  getGender() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await govCityData.genderView();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        genderData.addAll(datalist.map((e) => GenderModel.fromJson(e)));

        for (var i = 0; i < genderData.length; i++) {
          genderDropDownList.add(SelectedListItem(
              name: genderData[i].genderType!,
              value: genderData[i].genderId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  intialData() {
    getGovs();
    getGender();
  }

  @override
  refreshPage() {
    update();
  }

  @override
  selectGovAndShowCity({required String selectedValue}) {
    isDisabledCity = false;
    cityDropDownList.clear();
    getCity(govId: selectedValue);
    refreshPage();
  }

  @override
  void onInit() {
    genderName = TextEditingController();
    genderId = TextEditingController();

    govName = TextEditingController();
    govId = TextEditingController();

    cityName = TextEditingController();
    cityId = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  void dispose() {
    genderId.dispose();
    genderName.dispose();
    govId.dispose();
    govName.dispose();
    cityId.dispose();
    cityName.dispose();
    super.dispose();
  }
}
