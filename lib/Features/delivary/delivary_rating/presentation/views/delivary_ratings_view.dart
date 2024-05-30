import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/defult_rating_bar.dart';
import '../../controller/delivary_ratings_controller.dart';
import '../widgets/delivary_rating_listview.dart';

class DelivaryRatingsView extends StatelessWidget {
  const DelivaryRatingsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryRatingsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              text: "التقييم",
              isText: true,
            ),
            GetBuilder<DelivaryRatingsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        controller.averageRating ?? "0",
                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      DefultRatingBar(
                        initialRating:
                            double.parse(controller.averageRating.toString()),
                        ignoreGestures: true,
                        allowHalfRating: true,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        sizeIcon: 26.0,
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        "${controller.totalRatings} تقييم",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Row(
                        children: [
                          Text(
                            "جميع التقييمات",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const DelivaryRatingListview(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
