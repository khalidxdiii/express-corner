import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DelivaryPaymentMethodNotes extends StatelessWidget {
  const DelivaryPaymentMethodNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: const Color(0xffFFE8E8),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ملاحظات:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "1-   يرجى تحضير المبلغ المطلوب قبل وصول مندوب التوصيل.",
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
          Text(
            "2-   سيتسلم مندوب التوصيل المبلغ منك عند تسليم الطلب.",
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
          Text(
            "3-   في حال عدم توفر المبلغ عند استلام الطلب، سيتم إلغاء الطلب.",
            style: TextStyle(fontSize: 10, color: Colors.black),
          )
        ],
      ),
    );
  }
}
