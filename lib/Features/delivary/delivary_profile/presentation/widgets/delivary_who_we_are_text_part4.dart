import 'package:flutter/material.dart';

class DelivaryWhoWeAreTextPart4 extends StatelessWidget {
  const DelivaryWhoWeAreTextPart4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "التزامنا:",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
              '    •   "نلتزم بتقديم أفضل خدمة توصيل ممكنة لعملائنا، ونعمل باستمرار على تحسين خدماتنا وتطويرها."',
              style: TextStyle(fontSize: 10)),
          Text(
              '    •   "ندرك أهمية رضا العملاء، ونحرص على تقديم خدمة عملاء ممتازة للرد على جميع استفساراتكم وشكاويكم."',
              style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
