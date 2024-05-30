import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class DelivaryCustomGreenCard extends StatelessWidget {
  const DelivaryCustomGreenCard({
    super.key,
    required this.title,
    required this.text1,
    required this.text2,
  });
  final String title;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.fithColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            text1,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
