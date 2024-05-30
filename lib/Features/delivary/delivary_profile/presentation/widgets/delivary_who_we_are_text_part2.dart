import 'package:flutter/material.dart';

class DelivaryWhoWeAreTextPart2 extends StatelessWidget {
  const DelivaryWhoWeAreTextPart2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: AppColor.fithColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "خدماتنا:",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text('نقدم مجموعة واسعة من خدمات التوصيل، بما في ذلك:',
              style: TextStyle(fontSize: 10)),
          Text("    •   توصيل الطعام من المطاعم.",
              style: TextStyle(fontSize: 10)),
          Text("    •   توصيل البقالة من محلات السوبر ماركت.",
              style: TextStyle(fontSize: 10)),
          Text("    •   توصيل الأدوية من الصيدليات.",
              style: TextStyle(fontSize: 10)),
          Text("    •   توصيل الطلبات من أي متجر أو محل.",
              style: TextStyle(fontSize: 10)),
          Text("    •   وغيرها من الخدمات حسب احتياجاتك.",
              style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
