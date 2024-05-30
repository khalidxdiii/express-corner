import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../controllers/orders_details_controller.dart';
import '../widgets/oders_details/custom_order_details_tab_bar.dart';

class OrdersDetailsView extends StatelessWidget {
  const OrdersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomDefultButton(
          text: "حالة الطلب",
          onPressed: () {
            Get.toNamed(AppRoute.ordersStatus, arguments: {
              "orderId": controller.dataOrder.ordersId.toString()
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
            GetBuilder<OrdersDetailsController>(
              builder: (controller) => Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CustomOrderDetailsTabBar(),
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
