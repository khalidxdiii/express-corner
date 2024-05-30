import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/approutes.dart';
import '../../../controllers/delivary_orders_controller.dart';
import 'delivary_card_items/delivary_pinding_card_item.dart';

class DelivaryOrdersPindingListView
    extends GetView<DelivaryOrdersControllerImp> {
  const DelivaryOrdersPindingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DelivaryOrdersControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequestPinding,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.pindingDataOrders.length,
          itemBuilder: (context, index) {
            return DelivaryPindingCardItem(
              orderId: controller.pindingDataOrders[index].ordersId.toString(),
              index: index,
              userName: controller.pindingDataOrders[index].userName.toString(),
              userImageUrl:
                  controller.pindingDataOrders[index].userImage.toString(),
              userLocation:
                  "${controller.pindingDataOrders[index].userGov.toString()} - ${controller.pindingDataOrders[index].userCity.toString()}",
              startLocation: controller
                  .pindingDataOrders[index].ordersAddressUserDetails
                  .toString(),
              endLocation: controller
                  .pindingDataOrders[index].ordersToAddressName
                  .toString(),
              totalPrice: controller.pindingDataOrders[index].ordersTotalprice
                  .toString(),
              time:
                  controller.pindingDataOrders[index].ordersDatetime.toString(),
              onDetails: () {
                Get.toNamed(AppRoute.delivaryOrdersDetailsView, arguments: {
                  "dataOrderDetails": controller.pindingDataOrders[index],
                  "status": "pinding",
                });
              },
              onApprove: () {
                controller.delivaryApproveOrder(
                  orderid:
                      controller.pindingDataOrders[index].ordersId.toString(),
                  usersid: controller.pindingDataOrders[index].ordersUsersid
                      .toString(),
                );
              },
              onRefuse: () {
                controller.rejectPindingOrders(
                    orderid: controller.pindingDataOrders[index].ordersId
                        .toString());
                // Get.toNamed(AppRoute.ordersStatus, arguments: {
                //   "orderId":
                //       controller.pindingDataOrders[index].ordersId.toString()
                // });
              },
            );
          },
        ),
      ),
    );
  }
}
