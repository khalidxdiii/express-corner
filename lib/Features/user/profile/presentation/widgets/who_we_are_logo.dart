import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/imageasset.dart';

class WhoWeAreLogo extends StatelessWidget {
  const WhoWeAreLogo({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3.3,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF005338),
              Color(0xFF2FAB8D),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          // color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(88),
          )),
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 13,
                        color: Colors.white,
                      ),
                      Text(
                        "رجوع",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          // height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 50,
              child: Image.asset(
                AppImageAsset.logo,
                height: 100,
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     padding: EdgeInsets.all(20),
            //     color: Colors.blue,
            //     height: Get.height - 200,
            //     width: Get.width,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
