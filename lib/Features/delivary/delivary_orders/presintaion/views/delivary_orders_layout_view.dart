import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../auth/presentation/widgets/logoauth.dart';
import '../../controllers/delivary_orders_controller.dart';
import '../widgets/delivary_orders_layout/orders_switch_button.dart';

class DelivaryOrdersLayoutView extends StatelessWidget {
  const DelivaryOrdersLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryOrdersControllerImp());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Get.find<DelivaryOrdersControllerImp>()
                .delivaryRefreshOrders();
          },
          child: ListView(
            children: [
              const LogoAuth(
                isText: true,
                text: "الطلبات",
                isBack: false,
              ),
              GetBuilder<DelivaryOrdersControllerImp>(
                builder: (controller) => Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const OrdersSwitchButton(),
                      controller.pages[controller.currentPage!],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
