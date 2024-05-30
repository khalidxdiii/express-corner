import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/add_order_controller.dart';
import '../widgets/add_new_order/order_slider.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    AddOrderControllerImp controller = Get.put(AddOrderControllerImp());

    return WillPopScope(
      onWillPop: () {
        return controller.onWillPop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: controller.key,
            child: ListView(
              children: [
                const LogoAuth(
                  isText: true,
                  text: "اطلب",
                ),
                GetBuilder<AddOrderControllerImp>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      children: [
                        const SizedBox(height: 5),
                        const CustomSliderControllerAddOrder(),
                        SizedBox(
                          height: Get.height * 0.62,
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (value) {
                              controller.onPageChanged(value);
                            },
                            controller: controller.pageController!,
                            itemBuilder: (context, index) =>
                                controller.pages[index],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomDefultButton(
                            text: "التالى",
                            onPressed: () {
                              controller.changePage();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
