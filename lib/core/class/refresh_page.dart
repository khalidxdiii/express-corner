import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../constant/colors.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage({super.key, required this.widget, required this.onRefresh});
  final Widget widget;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      color: AppColor.backGround,
      backgroundColor: AppColor.primaryColor,
      onRefresh: onRefresh,
      child: widget,
    );
  }
}
