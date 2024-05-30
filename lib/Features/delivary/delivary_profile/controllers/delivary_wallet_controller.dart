import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/paymob_manger/paymob_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/class/statusRequest.dart';
import '../../../empthy status/presentation/views/status_success_view.dart';

abstract class DelivaryWalletController extends GetxController {
  confirm();
}

class DelivaryWalletControllerImp extends DelivaryWalletController {
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<FormState> key;
  late TextEditingController cash;

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
    ///// work online card ////////

    // PaymobManger().getPaymentKey(10, "EGP").then((String paymentKey) =>
    //     launchUrl(Uri.parse(
    //         "https://accept.paymob.com/api/acceptance/iframes/846900?payment_token=$paymentKey")));

    ////////////////

// wallet
    PaymobManger()
        .testgetPaymentWalletKey(1000, "EGP")
        .then((String paymentKey) => launchUrl(Uri.parse(paymentKey)));
  }

  @override
  void onInit() {
    cash = TextEditingController();
    key = GlobalKey<FormState>();
    super.onInit();
  }
}
