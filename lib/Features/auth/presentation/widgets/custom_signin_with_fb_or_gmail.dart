import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CustomSignInWithFbOrGmail extends StatelessWidget {
  const CustomSignInWithFbOrGmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 100,
      child: const Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "او قم بالتسجيل الدخول باستخدام",
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomFbOrGmailButton(
                  text: "جوجل",
                  image: AppImageAsset.googleLogo,
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: CustomFbOrGmailButton(
                  text: "فيسبوك",
                  image: AppImageAsset.fbLogo,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomFbOrGmailButton extends StatelessWidget {
  const CustomFbOrGmailButton(
      {super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE1E1E1),
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              height: 0.9,
            ),
          )
        ],
      ),
    );
  }
}
