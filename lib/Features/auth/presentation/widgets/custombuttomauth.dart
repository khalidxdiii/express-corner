import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key,
      required this.text,
      this.onPressed,
      this.width,
      this.bgColor = AppColor.primaryColor,
      this.textColor = Colors.white});
  final String text;
  final void Function()? onPressed;
  final double? width;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 20),
        onPressed: onPressed,
        color: bgColor,
        textColor: textColor,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
