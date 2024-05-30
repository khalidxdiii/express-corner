import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  const CustomTextSignUpOrSignIn(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.onTap});
  final String textOne;
  final String textTwo;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne,
            style: const TextStyle(
              fontSize: 12,
              // color: Color(0xff222222),
            )),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo,
            style: const TextStyle(
                fontSize: 12,
                color: Color(0xff222222),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
