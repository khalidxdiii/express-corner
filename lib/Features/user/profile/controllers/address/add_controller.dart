import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/controller/gov_city_controller.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';
import '../../data/datasorce/remote/address_data.dart';

class AddAdressController extends GovCityControllerImp {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController addressDetails = TextEditingController();

  TextEditingController addressType = TextEditingController();
  late GlobalKey<FormState> key;
  String? lat;
  String? long;

  add() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.add(
        userId: myServices.sharedPreferences.getString("id")!,
        addressDetails: addressDetails.text,
        city: cityName.text,
        gov: govName.text,
        addressType: addressType.text,
        lat: lat!,
        long: long!,
      );
      debugPrint('==================== Add Address Controller $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.homeLayoutView);
          Get.snackbar(
            "تنبية",
            "الآن، يمكنك الطلب على هذا العنوان",
            backgroundColor: AppColor.fithColor,
            colorText: AppColor.primaryColor,
          );
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    // print(lat);
    // print(long);
  }

  @override
  void onInit() {
    initialData();
    addressDetails = TextEditingController();

    addressType = TextEditingController();
    key = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    addressDetails.dispose();
    addressType.dispose();

    super.dispose();
  }
}
