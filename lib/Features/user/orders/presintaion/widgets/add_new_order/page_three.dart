import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/imageasset.dart';
import '../../../../../../core/functions/validinput.dart';
import '../../../../../../core/shared/defult_textformfield.dart';
import '../../../controllers/add_order_controller.dart';
import 'add_order_price_card.dart';
import 'red_card_note.dart';

class PageThree extends GetView<AddOrderControllerImp> {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text(
            "الحساب",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Text(
            "ادخل السعر التقريبي لطلبك",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          CustomDefultTextForm(
            hintText: "اكتب السعر التقريبي للطلب",
            lableText: "اكتب السعر التقريبي للطلب",
            iconData: Icons.money,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            removePrefixIcon: true,
            myController: controller.price,
            onChanged: (value) {
              if (value.isEmpty) {
                value = "0";
                controller.calcTotalPriceWithShipping(value);
              } else {
                controller.calcTotalPriceWithShipping(value);
              }
            },
            isNumber: true,
            validator: (value) {
              return validinput(val: value!, min: 1, max: 11, type: "cash");
            },
          ),
          const AddOrderPriceCard(),
          const AddOrderRedCardNote(),
          const SizedBox(height: 10),
          const Text(
            "اختر طريقة الدفع",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // SizedBox(height: 5),
          Row(
            children: [
              // SvgPicture.asset(AppIconsAsset.orderCash),
              Image.asset(AppImageAsset.orderCash, width: 30, height: 30),
              const SizedBox(width: 10),
              const Text(
                "نقدي",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
