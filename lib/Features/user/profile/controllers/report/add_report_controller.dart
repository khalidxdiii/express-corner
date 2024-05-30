import 'package:express_corner/Features/empthy%20status/presentation/views/status_success_view.dart';
import 'package:express_corner/Features/user/profile/data/datasorce/remote/add_report_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/statusRequest.dart';
import '../../../../../core/constant/approutes.dart';
import '../../../../../core/controller/gov_city_controller.dart';
import '../../../../../core/functions/handlingdata.dart';
import '../../../../../core/services/services.dart';

class DelivaryAddReportController extends GovCityControllerImp {
  late GlobalKey<FormState> key;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController subject;
  late TextEditingController phone;

  AddReportData addressData = AddReportData(Get.find());
  MyServices myServices = Get.find();

  sendReport() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addReport(
        userId: myServices.sharedPreferences.getString("id")!,
        username: username.text,
        email: email.text,
        city: cityName.text,
        gov: govName.text,
        phone: phone.text,
        subject: subject.text,
      );
      debugPrint('==================== Add Report Controller $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.off(StatusSuccessView(
            title: "تم تقديم الشكوى بنجاح!",
            body: "تم تقديم شكوتك بنجاح وسيتم مراجعتها والرد فى اسرع وقت .",
            onPressed: () {
              Get.offAllNamed(AppRoute.homeLayoutView);
            },
          ));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    key = GlobalKey<FormState>();
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    subject = TextEditingController();

    super.onInit();
  }
}
