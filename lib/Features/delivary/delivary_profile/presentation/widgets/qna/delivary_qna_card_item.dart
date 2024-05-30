import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/app_icons_assets.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../data/models/qnr_model.dart';

class DelivaryQnACardItem extends StatefulWidget {
  final QnAPair qnaPair;

  const DelivaryQnACardItem({super.key, required this.qnaPair});

  @override
  _DelivaryQnACardItemState createState() => _DelivaryQnACardItemState();
}

class _DelivaryQnACardItemState extends State<DelivaryQnACardItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: selected ? const Color(0xffE0F3EF) : Colors.white,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.qnaPair.question,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: selected ? Colors.black : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    selected
                        ? SvgPicture.asset(AppIconsAsset.arrowUp)
                        : SvgPicture.asset(AppIconsAsset.arrowDown)
                  ],
                ),
                if (selected) const Divider(color: Color(0xffB4E1D6)),
                if (selected)
                  Text(
                    widget.qnaPair.answer,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: selected ? AppColor.primaryColor : Colors.black,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
