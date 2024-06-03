import 'package:express_corner/core/paymob_manger/paymob_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../../core/services/services.dart';

abstract class DelivaryWalletController extends GetxController {
  confirm();
}

class DelivaryWalletControllerImp extends DelivaryWalletController {
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<FormState> key;
  late TextEditingController cash;
  MyServices myServices = Get.find();

  // @override
  // confirm() {
  //   if (key.currentState!.validate()) {
  //     Get.to(StatusSuccessView(
  //       title: "تم اختيار نقدي بنجاح!",
  //       body: "تم اختيار الدفع نقدي  كطريقة للدفع, استمتع بتجربة دليفرى سلسة.",
  //       onPressed: () {
  //         Get.offAllNamed(AppRoute.homeLayoutView);
  //       },
  //     ));
  //   }
  // }

  @override
  confirm() {
    PaymobManger().pay(
        amount: 500,
        currency: "EGP",
        userFirstName: "Test",
        userLastName: "Flutter",
        userPhoneNumber: "+201272781129");
  }

  @override
  void onInit() {
    cash = TextEditingController();
    key = GlobalKey<FormState>();
    super.onInit();
  }
}
