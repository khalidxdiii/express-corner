import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back),
          SizedBox(width: 5),
          Text(
            "رجوع",
            style: TextStyle(color: Colors.black, height: 0.8),
          ),
        ],
      ),
    );
  }
}
