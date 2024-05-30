import 'package:express_corner/core/constant/colors.dart';
import 'package:flutter/material.dart';

import 'custom_green_card.dart';
import 'who_we_are_text_part2.dart';
import 'who_we_are_text_part3.dart';
import 'who_we_are_text_part4.dart';

class WhoWeAreContent extends StatelessWidget {
  const WhoWeAreContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColor.fithColor, // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 6), // Offset position of the shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: const Column(
        children: [
          CustomGreenCard(
            title: "“Express Corner ” ",
            text1:
                ' •   هو تطبيق توصيل سريع تم تأسيسه عام 2013، مما يمنحنا خبرة واسعة تزيد عن 10 سنوات في مجال التوصيل."',
            text2:
                ' •   "نهدف إلى توفير خدمة توصيل سريعة، آمنة، وموثوقة لجميع احتياجاتك، ليس فقط من المطاعم، بل من مختلف المتاجر والمحلات."',
          ),
          SizedBox(height: 5),
          Divider(),
          WhoWeAreTextPart2(),
          SizedBox(height: 5),
          WhoWeAreTextPart3(),
          SizedBox(height: 5),
          Divider(),
          WhoWeAreTextPart4(),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
