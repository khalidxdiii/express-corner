import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../controllers/delivary_orders_controller.dart';
import '../../controllers/delivary_orders_details_controller.dart';
import '../widgets/delivary_oders_details/delivary_custom_order_details_tab_bar.dart';

class DelivaryOrdersDetailsView extends StatelessWidget {
  const DelivaryOrdersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    DelivaryOrdersDetailsController controller =
        Get.put(DelivaryOrdersDetailsController());
    return Scaffold(
      bottomNavigationBar: controller.dataOrder.ordersStatus == 0
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomDefultButton(
                text: "قبول",
                onPressed: () {
                  Get.find<DelivaryOrdersControllerImp>().delivaryApproveOrder(
                    orderid: controller.dataOrder.ordersId.toString(),
                    usersid: controller.dataOrder.ordersUsersid.toString(),
                  );

                  //  Get.toNamed(AppRoute.ordersStatus, arguments: {
                  //   "orderId": controller.dataOrder.ordersId.toString()
                  // });
                },
                // isSecButton: true,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomDefultButton(
                text: "حالة الطلب",
                onPressed: () {
                  Get.toNamed(AppRoute.delivaryOrdersStatusView, arguments: {
                    "orderId": controller.dataOrder.ordersId.toString(),
                    "usersID": controller.dataOrder.ordersUsersid.toString()
                  });
                },
                isSecButton: true,
              ),
            ),
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "تفاصيل الطلب",
            ),
            GetBuilder<DelivaryOrdersDetailsController>(
              builder: (controller) => Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const DelivaryCustomOrderDetailsTabBar(),
                    const SizedBox(height: 5),
                    controller.pages.toList()[controller.currentPage]["page"]
                        as Widget,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
