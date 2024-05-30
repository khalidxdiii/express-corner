import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:express_corner/core/shared/defult_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/validinput.dart';
import '../../../../../core/shared/defult_button.dart';
import '../../controllers/delivary_wallet_controller.dart';
import '../widgets/delivary_payment_method_notes.dart';

class DelivaryWalletView extends StatelessWidget {
  const DelivaryWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    DelivaryWalletControllerImp controller =
        Get.put(DelivaryWalletControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(right: 16, left: 16, bottom: 25, top: 10),
        child: CustomDefultButton(
          text: "تاكيد",
          onPressed: () {
            controller.confirm();
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "طريقة الدفع",
            ),
            GetBuilder<DelivaryWalletControllerImp>(
              builder: (controller) => Builder(
                builder: (context) {
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.key,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image.asset(AppImageAsset.cashMethod)),
                            const SizedBox(height: 20),
                            const Text(
                              "المبلغ التقديرى للاوردر:",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 5),
                            CustomDefultTextForm(
                              hintText: "",
                              lableText: "",
                              iconData: Icons.money,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              myController: controller.cash,
                              isNumber: true,
                              validator: (value) {
                                return validinput(
                                    val: value!, min: 1, max: 11, type: "cash");
                              },
                            ),
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 5),
                            const DelivaryPaymentMethodNotes(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
