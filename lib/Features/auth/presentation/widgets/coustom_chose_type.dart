import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class CustomChooseType extends StatelessWidget {
  const CustomChooseType(
      {super.key,
      required this.text,
      required this.image,
      required this.isSelected,
      required this.onTap});
  final String text;
  final String image;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  // color: const Color(0xFFE1E1E1),
                  color: isSelected
                      ? AppColor.primaryColor
                      : const Color(0xFFE1E1E1),
                  width: 2.0,
                ),
              ),
              child: Image.asset(
                image,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? AppColor.primaryColor : AppColor.gray),
            )
          ],
        ),
      ),
    );
  }
}
