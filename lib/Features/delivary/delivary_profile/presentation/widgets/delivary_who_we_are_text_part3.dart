import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class DelivaryWhoWeAreTextPart3 extends StatelessWidget {
  const DelivaryWhoWeAreTextPart3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.fithColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "مميزاتنا",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            "نتميز بالعديد من المزايا التي تجعلنا الخيار الأمثل لاحتياجات التوصيل الخاصة بك، منها:",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
          ),
          Text(
            "    •   سرعة التوصيل: نلتزم بتوصيل طلباتك في أسرع وقت ممكن.",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
          ),
          Text(
            "    •   الدقة: نحرص على توصيل طلباتك بدقة وكفاءة عالية.",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
          ),
          Text(
            "    •   الأمان: نستخدم أحدث تقنيات التتبع لضمان سلامة طلباتك.",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
          ),
          Text(
            "    •   الأسعار التنافسية: نقدم أسعارًا تنافسية تناسب جميع الميزانيات.",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
