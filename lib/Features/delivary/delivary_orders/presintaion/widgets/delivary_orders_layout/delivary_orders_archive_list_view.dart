import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/approutes.dart';
import '../../../controllers/delivary_orders_controller.dart';
import 'delivary_card_items/delivary_archive_card_item.dart';

class DelivaryOrdersArchiveListView
    extends GetView<DelivaryOrdersControllerImp> {
  const DelivaryOrdersArchiveListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DelivaryOrdersControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequestArchive,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.archiveDataOrders.length,
          itemBuilder: (context, index) {
            return DelivaryArchiveCardItem(
              index: index,
              orderId: controller.archiveDataOrders[index].ordersId.toString(),
              delivaryName:
                  controller.archiveDataOrders[index].userName.toString(),
              userImageUrl:
                  controller.archiveDataOrders[index].userImage.toString(),
              delivaryLocation:
                  "${controller.archiveDataOrders[index].userGov.toString()} - ${controller.archiveDataOrders[index].userCity.toString()}",
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
                Get.toNamed(AppRoute.delivaryOrdersDetailsView, arguments: {
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
