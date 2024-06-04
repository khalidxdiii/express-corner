import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../delivary_orders/presintaion/widgets/delivary_orders_layout/delivary_card_items/delivary_pinding_card_item.dart';
import '../../controllers/delivary_home_controller.dart';
import '../widgets/delivary_custom_card_wallet.dart';
import '../widgets/delivary_custom_home_page_title.dart';
import '../widgets/delivary_home_page_header.dart';

class DelivaryHomePageView extends StatelessWidget {
  const DelivaryHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryHomePageControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            DelivaryHomePageHeader(
              onTap: () {},
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  DelivaryCustomHomePageTitle(
                    title: "محفظتي",
                    navTitle: "المزيد",
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  const DelivaryCustomCardWallet(total: "50"),
                  DelivaryCustomHomePageTitle(
                    title: "طلبات هذا اليوم",
                    navTitle: "شاهد الكل",
                    onTap: () {},
                  ),
                  // DelivaryPindingCardItem(
                  //   index: 0,
                  //   orderId: "1",
                  //   userName: "test user",
                  //   userImageUrl: "",
                  //   time: "",
                  //   startLocation: "",
                  //   endLocation: "",
                  //   userLocation: "",
                  //   totalPrice: "500",
                  //   onApprove: () {},
                  //   onDetails: () {},
                  //   onRefuse: () {},
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
