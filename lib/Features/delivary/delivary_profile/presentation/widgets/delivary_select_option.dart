import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_icons_assets.dart';

class DelivarySelectOption extends StatelessWidget {
  const DelivarySelectOption({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.isSwitch = false,
    this.onChanged,
    this.checkValue = true,
    this.isWidget = false,
    this.widget,
    this.width = 28,
    this.height = 28,
    this.subtitle,
  });
  final String text;
  final String icon;
  final Function() onTap;
  final bool? isSwitch;
  final bool? isWidget;
  final void Function(bool?)? onChanged;
  final bool checkValue;
  final Widget? widget;
  final double? width;
  final double? height;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: const Color(0xF9F9F9),
      title: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle,
      leading: CircleAvatar(
        backgroundColor: const Color(0x00eff0fd),
        child: SvgPicture.asset(
          icon,
          height: height,
          width: width,
        ),
      ),
      trailing: isWidget == true
          ? widget
          : isSwitch == false
              ? Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SvgPicture.asset(AppIconsAsset.arrowListTile),
                )
              : Transform.scale(
                  scale: 1,
                  child: Switch(value: checkValue, onChanged: onChanged),
                ),
    );
  }
}
