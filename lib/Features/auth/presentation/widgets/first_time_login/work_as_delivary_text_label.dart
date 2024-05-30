import 'package:flutter/material.dart';

class WorkAsDelivaryTextLabel extends StatelessWidget {
  final String text;

  const WorkAsDelivaryTextLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
