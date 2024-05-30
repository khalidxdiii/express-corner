import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/empty_status_controller.dart';

class EmptyFavoriteView extends StatelessWidget {
  const EmptyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmptyStatusControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height / 25,
          ),
          SvgPicture.asset(
            AppIconsAsset.emptyFavorite,
          ),
          // const SizedBox(height: 20),
          const Text(
            'لا يوجد حفظ لشئ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 15),
          const Text(
            'ليس لديك أي أماكن محفوظة، يرجى العثور عليها في \nالبحث لحفظ الاماكن.',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
