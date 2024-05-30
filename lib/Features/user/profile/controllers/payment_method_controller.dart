import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../empthy status/presentation/views/status_success_view.dart';

abstract class PaymentMethodController extends GetxController {
  confirm();
}

class PaymentMethodControllerImp extends PaymentMethodController {
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<FormState> key;
  late TextEditingController cash;

  @override
  confirm() {
    if (key.currentState!.validate()) {
      Get.to(StatusSuccessView(
        title: "تم اختيار نقدي بنجاح!",
        body: "تم اختيار الدفع نقدي  كطريقة للدفع, استمتع بتجربة دليفرى سلسة.",
        onPressed: () {
          Get.offAllNamed(AppRoute.homeLayoutView);
        },
      ));
    }
  }

  @override
  void onInit() {
    cash = TextEditingController();
    key = GlobalKey<FormState>();
    super.onInit();
  }
}
