import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class CustomButtonLang extends StatelessWidget {
  const CustomButtonLang({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: MaterialButton(
        textColor: Colors.white,
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
