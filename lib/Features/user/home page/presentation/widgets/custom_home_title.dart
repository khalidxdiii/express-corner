import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class CustomHomeTitle extends StatelessWidget {
  const CustomHomeTitle({
    super.key,
    required this.title,
    this.onTap,
    this.isShowAll = true,
  });
  final String title;
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
                  child: const Row(
                    children: [
                      Text(
                        "عرض الكل",
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            color: AppColor.primaryColor),
                      ),
                      Icon(Icons.arrow_forward_rounded,
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
