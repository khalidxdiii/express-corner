import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';
import '../../data/datasorce/remote/address_data.dart';
import '../../data/models/address_model.dart';

abstract class ViewAdressController extends GetxController {
  view();
  delete({required String addressID});
}

class ViewAdressControllerImp extends ViewAdressController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> adressData = [];

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.view(
      userId: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint('==================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        adressData.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        if (adressData.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        // Get.offNamed(AppRoute.emptyAddress);
        statusRequest = StatusRequest.emptyAddress;
      }
    }
    update();
  }

  @override
  delete({required String addressID}) {
    addressData.delete(addressId: addressID);
    adressData.removeWhere((element) => element.addressId == addressID);
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
