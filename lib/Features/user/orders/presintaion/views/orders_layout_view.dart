import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../auth/presentation/widgets/logoauth.dart';
import '../../controllers/orders_controller.dart';
import '../widgets/orders_layout/orders_switch_button.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImp());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Get.find<OrdersControllerImp>().refreshOrders();
          },
          child: ListView(
            // shrinkWrap: true,
            // physics: const BouncingScrollPhysics(),
            children: [
              const LogoAuth(
                isText: true,
                text: "الطلبات",
                isBack: false,
              ),
              GetBuilder<OrdersControllerImp>(
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
