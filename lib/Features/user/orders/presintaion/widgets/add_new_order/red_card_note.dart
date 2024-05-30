import 'package:flutter/material.dart';

class AddOrderRedCardNote extends StatelessWidget {
  const AddOrderRedCardNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffFF0000).withOpacity(0.1)),
      padding: const EdgeInsets.all(16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 18, color: Color(0xffFF0000)),
          SizedBox(width: 5),
          Text(
            "مع العلم، يمكن ان يزيد سعر التوصيل في حدود 5 - 10 ج.م.",
            style: TextStyle(fontSize: 10, color: Color(0xffFF0000)),
          )
        ],
      ),
    );
  }
}
