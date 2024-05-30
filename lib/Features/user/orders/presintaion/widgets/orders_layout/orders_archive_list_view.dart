import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/approutes.dart';
import '../../../controllers/orders_controller.dart';
import 'card_items/archive_card_item.dart';

class OrdersArchiveListView extends GetView<OrdersControllerImp> {
  const OrdersArchiveListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequestArchive,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.archiveDataOrders.length,
          itemBuilder: (context, index) {
            return ArchiveCardItem(
              index: index,
              orderId: controller.archiveDataOrders[index].ordersId.toString(),
              delivaryName:
                  controller.archiveDataOrders[index].deliveryName.toString(),
              delivaryImageUrl:
                  controller.archiveDataOrders[index].deliveryImage.toString(),
              delivaryLocation:
                  "${controller.archiveDataOrders[index].deliveryGov.toString()} - ${controller.archiveDataOrders[index].deliveryCity.toString()}",
              startLocation: controller
                  .archiveDataOrders[index].ordersAddressUserDetails
                  .toString(),
              endLocation: controller
                  .archiveDataOrders[index].ordersToAddressName
                  .toString(),
              // totalPrice: controller.currentDataOrders[index].ordersTotalprice
              //     .toString(),
              time:
                  controller.archiveDataOrders[index].ordersDatetime.toString(),
              onStatus: () {
                Get.toNamed(AppRoute.ordersDetailsView, arguments: {
                  "dataOrderDetails": controller.archiveDataOrders[index],
                  "status": "archive",
                });
              },
            );
          },
        ),
      ),
    );
  }
}
