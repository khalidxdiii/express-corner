import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/delivary_orders_controller.dart';
import 'delivary_card_items/delivary_accepted_card_item.dart';

class DelivaryOrdersAcceptedListView
    extends GetView<DelivaryOrdersControllerImp> {
  const DelivaryOrdersAcceptedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DelivaryOrdersControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequestCurrent,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.acceptedDataOrders.length,
          itemBuilder: (context, index) {
            return DelivaryAcceptedCardItem(
              index: index,
              orderId: controller.acceptedDataOrders[index].ordersId.toString(),
              delivaryName:
                  controller.acceptedDataOrders[index].userName.toString(),
              userImageUrl:
                  controller.acceptedDataOrders[index].userImage.toString(),
              delivaryLocation:
                  "${controller.acceptedDataOrders[index].userGov.toString()} - ${controller.acceptedDataOrders[index].userCity.toString()}",
              startLocation: controller
                  .acceptedDataOrders[index].ordersAddressUserDetails
                  .toString(),
              endLocation: controller
                  .acceptedDataOrders[index].ordersToAddressName
                  .toString(),
              totalPrice: controller.acceptedDataOrders[index].ordersTotalprice
                  .toString(),
              time: controller.acceptedDataOrders[index].ordersDatetime
                  .toString(),
              onDetails: () {
                Get.toNamed(AppRoute.delivaryOrdersDetailsView, arguments: {
                  "dataOrderDetails": controller.acceptedDataOrders[index],
                  "status": "current",
                });
              },
              onStatus: () {
                Get.toNamed(AppRoute.delivaryOrdersStatusView, arguments: {
                  "orderId":
                      controller.acceptedDataOrders[index].ordersId.toString(),
                  "usersID": controller.acceptedDataOrders[index].ordersUsersid
                      .toString()
                });
              },
            );
          },
        ),
      ),
    );
  }
}
