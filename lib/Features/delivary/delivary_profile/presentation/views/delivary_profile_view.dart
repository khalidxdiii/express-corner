import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/delivary_profile_controller.dart';
import '../widgets/delivary_profile_options.dart';
import '../widgets/delivary_info.dart';

class DelivaryProfileView extends StatelessWidget {
  const DelivaryProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryProfileControllerImp());
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<DelivaryProfileControllerImp>(
        builder: (controller) => HandlingDataView(
          isCenter: true,
          statusRequest: controller.statusRequest,
          widget: ListView(
            shrinkWrap: true,
            children: [
              const LogoAuth(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    DelivaryInfo(
                        delivaryStatus:
                            controller.delivaryStatusType.toString()),
                    // DelivaryInfo(
                    //     delivaryStatus: controller.myServices.sharedPreferences
                    //         .getString("delivaryStatusType")
                    //         .toString()),

                    const SizedBox(height: 15),
                    const DelivaryProfileOptions(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
