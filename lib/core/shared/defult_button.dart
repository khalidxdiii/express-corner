import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomDefultButton extends StatelessWidget {
  const CustomDefultButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isShowIcon = false,
      this.isSecButton = false,
      this.icon = AppIconsAsset.exit,
      this.isPadding = false,
      this.iscustomWidth = false,
      this.padding = const EdgeInsets.symmetric(vertical: 20),
      this.color});
  final String text;
  final void Function() onPressed;
  final bool? isShowIcon;
  final bool? isSecButton;
  final String? icon;
  final bool? isPadding;
  final bool? iscustomWidth;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iscustomWidth == false
          ? isPadding == false
              ? Get.width
              : Get.width - 120
          : null,
      margin: const EdgeInsets.only(top: 0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: isSecButton == true
              ? const BorderSide(color: AppColor.primaryColor)
              : const BorderSide(color: AppColor.primaryColor),
        ),
        padding: padding,
        onPressed: onPressed,
        color: color == null
            ? isSecButton == false
                ? AppColor.primaryColor
                : Colors.white
            : color!,
        textColor: isSecButton == false ? Colors.white : AppColor.primaryColor,
        child: isShowIcon == false
            ? Text(text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(icon!),
                const SizedBox(width: 5),
                Text(text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
      ),
    );
  }
}
