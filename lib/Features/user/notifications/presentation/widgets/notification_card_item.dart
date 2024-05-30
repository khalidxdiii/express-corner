import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsCardItem extends StatelessWidget {
  const NotificationsCardItem({
    Key? key,
    required this.title,
    required this.body,
    required this.type,
    required this.isRead,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String body;
  final String type;
  final bool isRead;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(body, style: const TextStyle(fontSize: 10)),
      leading: type == "system"
          ? SvgPicture.asset(isRead == true
              ? AppIconsAsset.notificationSystem
              : AppIconsAsset.notificationSystemActive)
          : SvgPicture.asset(isRead == true
              ? AppIconsAsset.notificationOrder
              : AppIconsAsset.notificationOrderActive),
    );
  }
}
