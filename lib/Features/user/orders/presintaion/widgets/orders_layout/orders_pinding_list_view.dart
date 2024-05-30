import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/approutes.dart';
import '../../../controllers/orders_controller.dart';
import 'card_items/pinding_card_item.dart';

class OrdersPindingListView extends GetView<OrdersControllerImp> {
  const OrdersPindingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequestPinding,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.pindingDataOrders.length,
          itemBuilder: (context, index) {
            return PindingCardItem(
              orderId: controller.pindingDataOrders[index].ordersId.toString(),
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
                // Get.toNamed(AppRoute.pindingOrdersDetails, arguments: {
                //   "pindingDataOrders": controller.pindingDataOrders[index],
                // });
                Get.toNamed(AppRoute.ordersDetailsView, arguments: {
                  "dataOrderDetails": controller.pindingDataOrders[index],
                  "status": "pinding",
                });
              },
              onDelete: () {
                controller.deletePindingOrders(
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
