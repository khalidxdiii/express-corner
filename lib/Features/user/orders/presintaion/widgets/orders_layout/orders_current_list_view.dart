import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/orders_controller.dart';
import 'card_items/current_card_item.dart';

class OrdersCurrentListView extends GetView<OrdersControllerImp> {
  const OrdersCurrentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequestCurrent,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.currentDataOrders.length,
          itemBuilder: (context, index) {
            return CurrentCardItem(
              index: index,
              orderId: controller.currentDataOrders[index].ordersId.toString(),
              delivaryName:
                  controller.currentDataOrders[index].deliveryName.toString(),
              delivaryImageUrl:
                  controller.currentDataOrders[index].deliveryImage.toString(),
              delivaryLocation:
                  "${controller.currentDataOrders[index].deliveryGov.toString()} - ${controller.currentDataOrders[index].deliveryCity.toString()}",
              startLocation: controller
                  .currentDataOrders[index].ordersAddressUserDetails
                  .toString(),
              endLocation: controller
                  .currentDataOrders[index].ordersToAddressName
                  .toString(),
              totalPrice: controller.currentDataOrders[index].ordersTotalprice
                  .toString(),
              time:
                  controller.currentDataOrders[index].ordersDatetime.toString(),
              onDetails: () {
                Get.toNamed(AppRoute.ordersDetailsView, arguments: {
                  "dataOrderDetails": controller.currentDataOrders[index],
                  "status": "current",
                });
              },
              onStatus: () {
                Get.toNamed(AppRoute.ordersStatus, arguments: {
                  "orderId":
                      controller.currentDataOrders[index].ordersId.toString()
                });
              },
            );
          },
        ),
      ),
    );
  }
}
