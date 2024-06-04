import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class DelivaryCustomHomePageTitle extends StatelessWidget {
  const DelivaryCustomHomePageTitle({
    super.key,
    required this.title,
    this.onTap,
    this.isShowAll = true, required this.navTitle,
  });
  final String title;
  final String navTitle;
  final void Function()? onTap;
  final bool? isShowAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Spacer(),
          isShowAll == true
              ? GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Text(
                        navTitle,
                        style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            color: AppColor.primaryColor),
                      ),
                      const Icon(Icons.arrow_forward_rounded,
                          color: AppColor.primaryColor, size: 10),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
