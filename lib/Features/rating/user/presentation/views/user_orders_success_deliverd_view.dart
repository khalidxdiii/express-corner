import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/rating_user_order_success_deliverd_controller.dart';

class UserSuccessDeliverdOrderView extends StatelessWidget {
  const UserSuccessDeliverdOrderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(RatingUserOrderSuccessDeliverdController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<RatingUserOrderSuccessDeliverdController>(
          builder: (controller) => Column(
            children: [
              SizedBox(
                width: Get.width,
                child: const LogoAuth(isText: true, text: "الطلب"),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImageAsset.ok),
                    const SizedBox(height: 20),
                    const Text(
                      "تم استلام طلبك بنجاح",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      "يمكنك تقييم مندوب التوصيل حتى يمكننا التحسن باستمرار",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 30),
                    CustomDefultButton(
                      text: "تقييم",
                      onPressed: () {
                        Get.offNamed(
                          AppRoute.userRatingView,
                          arguments: {"orderId": controller.orderId},
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
