import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Features/empthy status/presentation/views/delivary_empty_orders_view.dart';
import '../../Features/empthy status/presentation/views/empty_address_view.dart';
import '../../Features/empthy status/presentation/views/empty_delivay_must_compele_orders_view.dart';
import '../../Features/empthy status/presentation/views/empty_favorite_view.dart';
import '../../Features/empthy status/presentation/views/empty_orders_view.dart';
import '../../Features/empthy status/presentation/views/notfication_empty_view.dart';
import '../constant/imageasset.dart';
import 'statusRequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final bool? isCenter;
  const HandlingDataView(
      {Key? key,
      required this.statusRequest,
      required this.widget,
      this.isCenter = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? SizedBox(
            height: isCenter != true ? Get.height / 1.5 : null,
            child: Center(child: Lottie.asset(AppImageAsset.loading)),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? SizedBox(
                height: isCenter != true ? Get.height / 1.5 : null,
                child: Center(
                    child: Lottie.asset(AppImageAsset.offline, width: 250)))
            : statusRequest == StatusRequest.serverfailure
                ? SizedBox(
                    height: isCenter != true ? Get.height / 1.5 : null,
                    child: Center(
                        child: Lottie.asset(AppImageAsset.serverFaliuer,
                            width: 350)),
                  )
                : statusRequest == StatusRequest.failure
                    ? SizedBox(
                        height: isCenter != true ? Get.height / 1.5 : null,
                        child: Center(
                            child:
                                Lottie.asset(AppImageAsset.noData, width: 300)),
                      )
                    : statusRequest == StatusRequest.emptyAddress
                        ? const EmptyAddressView()
                        : statusRequest == StatusRequest.emptyOrders
                            ? const EmptyOrdersView()
                            : statusRequest == StatusRequest.emptyNotification
                                ? const NotificationEmptyView()
                                : statusRequest == StatusRequest.emptyFavorite
                                    ? const EmptyFavoriteView()
                                    : statusRequest ==
                                            StatusRequest
                                                .delivaryMustCompleteOrders
                                        ? const EmptyDelivaryMustCompleteOrdersView()
                                        : statusRequest ==
                                                StatusRequest
                                                    .delivaryEmptyOrders
                                            ? const DelivaryEmptyOrdersView()
                                            : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppImageAsset.serverFaliuer, width: 350))
                : statusRequest == StatusRequest.serverException
                    ? Center(
                        child: Lottie.asset(AppImageAsset.serverFaliuer,
                            width: 350))
                    : widget;
  }
}
