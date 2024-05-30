import 'package:express_corner/core/constant/imageasset.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';

class StatusSuccessView extends StatelessWidget {
  const StatusSuccessView(
      {super.key,
      required this.title,
      required this.body,
      required this.onPressed});
  final String title;
  final String body;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImageAsset.ok),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                body,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              CustomDefultButton(text: "الرئيسية", onPressed: onPressed)
            ],
          ),
        ),
      ),
    );
  }
}
