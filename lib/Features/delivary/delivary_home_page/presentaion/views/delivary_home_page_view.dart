import 'package:express_corner/core/class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../delivary_Layout/presentation/controllers/delivary_home_layout_controller.dart';
import '../../../delivary_orders/controllers/delivary_orders_controller.dart';
import '../../controllers/delivary_home_controller.dart';
import '../widgets/delivary_custom_card_wallet.dart';
import '../widgets/delivary_custom_home_page_title.dart';
import '../widgets/delivary_home_archive_card_order.dart';
import '../widgets/delivary_home_page_header.dart';
import '../widgets/delivary_home_pinding_card_order.dart';

class DelivaryHomePageView extends StatelessWidget {
  const DelivaryHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryHomePageControllerImp());
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: GetBuilder<DelivaryHomePageControllerImp>(
          builder: (controller) => ListView(
            children: [
              DelivaryHomePageHeader(
                onTap: () {},
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    DelivaryCustomHomePageTitle(
                      // title: "محفظتي",
                      title: "رصيدك",
                      navTitle: "المزيد",
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    const DelivaryCustomCardWallet(total: "50"),
                    DelivaryCustomHomePageTitle(
                      title: "طلبات هذا اليوم",
                      navTitle: "شاهد الكل",
                      onTap: () {
                        DelivaryHomeLayoutControllerImp cLayout = Get.find();
                        cLayout.changePage(1);
                        DelivaryOrdersControllerImp cOrders = Get.find();
                        cOrders.choosePage(0);
                      },
                    ),
                    controller.statusRequestPinding == StatusRequest.loading
                        ? const SizedBox(
                            height: 100,
                            child: Center(child: CircularProgressIndicator()))
                        : controller.pindingDataOrders.isEmpty
                            ? const Text("لايوجد طلبات فى الوقت الحالى")
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 8),
                                child: DelivaryHomePindingCardOrderItem(
                                  orderId: controller
                                      .pindingDataOrders.first.ordersId
                                      .toString(),
                                  userName: controller
                                      .pindingDataOrders.first.userName
                                      .toString(),
                                  userImageUrl: controller
                                      .pindingDataOrders.first.userImage
                                      .toString(),
                                  time: controller
                                      .pindingDataOrders.first.ordersDatetime
                                      .toString(),
                                  startLocation: controller.pindingDataOrders
                                      .first.ordersAddressUserDetails
                                      .toString(),
                                  endLocation: controller.pindingDataOrders
                                      .first.ordersToAddressName
                                      .toString(),
                                  userLocation:
                                      "${controller.pindingDataOrders.first.userGov.toString()} - ${controller.pindingDataOrders.first.userCity.toString()}",
                                  totalPrice: controller
                                      .pindingDataOrders.first.ordersTotalprice
                                      .toString(),
                                  onApprove: () {
                                    DelivaryOrdersControllerImp()
                                        .delivaryApproveOrder(
                                      orderid: controller
                                          .pindingDataOrders.first.ordersId
                                          .toString(),
                                      usersid: controller
                                          .pindingDataOrders.first.ordersUsersid
                                          .toString(),
                                    );
                                  },
                                  onDetails: () {
                                    Get.toNamed(
                                        AppRoute.delivaryOrdersDetailsView,
                                        arguments: {
                                          "dataOrderDetails": controller
                                              .pindingDataOrders.first,
                                          "status": "pinding",
                                        });
                                  },
                                  onRefuse: () {
                                    DelivaryOrdersControllerImp()
                                        .rejectPindingOrders(
                                            orderid: controller
                                                .pindingDataOrders
                                                .first
                                                .ordersId
                                                .toString());
                                  },
                                ),
                              ),
                    DelivaryCustomHomePageTitle(
                      title: "طلباتك السابقة",
                      navTitle: "شاهد الكل",
                      onTap: () {
                        DelivaryHomeLayoutControllerImp cLayout = Get.find();
                        cLayout.changePage(1);
                        DelivaryOrdersControllerImp cOrders = Get.find();
                        cOrders.choosePage(2);
                      },
                    ),
                    controller.statusRequestArchive == StatusRequest.loading
                        ? const SizedBox(
                            height: 100,
                            child: Center(child: CircularProgressIndicator()))
                        : controller.archiveDataOrders.isEmpty
                            ? const Text("لم تقم بتوصيل اى طلبات حتى الان")
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 8, bottom: 8),
                                child: DelivaryHomePageArchiveCardOrder(
                                  orderId: controller
                                      .archiveDataOrders.first.ordersId
                                      .toString(),
                                  delivaryName: controller
                                      .archiveDataOrders.first.userName
                                      .toString(),
                                  userImageUrl: controller
                                      .archiveDataOrders.first.userImage
                                      .toString(),
                                  delivaryLocation:
                                      "${controller.archiveDataOrders.first.userGov.toString()} - ${controller.archiveDataOrders.first.userCity.toString()}",
                                  startLocation: controller.archiveDataOrders
                                      .first.ordersAddressUserDetails
                                      .toString(),
                                  endLocation: controller.archiveDataOrders
                                      .first.ordersToAddressName
                                      .toString(),
                                  // totalPrice: controller.currentDataOrders[index].ordersTotalprice
                                  //     .toString(),
                                  time: controller
                                      .archiveDataOrders.first.ordersDatetime
                                      .toString(),
                                  onStatus: () {
                                    Get.toNamed(
                                        AppRoute.delivaryOrdersDetailsView,
                                        arguments: {
                                          "dataOrderDetails": controller
                                              .archiveDataOrders.first,
                                          "status": "archive",
                                        });
                                  },
                                ),
                              )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
