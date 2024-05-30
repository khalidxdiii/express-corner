import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';

class DefultCustomImageSelectionWidget extends StatelessWidget {
  // final WorkAsDelivaryControllerImp controller;

  final File? fileImage;
  final void Function() onTap;
  final void Function() onDelete;

  const DefultCustomImageSelectionWidget({
    super.key,
    // required this.controller,

    required this.fileImage,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: fileImage != null
            ? Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: DottedBorder(
                      strokeWidth: 2,
                      color: AppColor.gray,
                      dashPattern: [8, 4],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Center(
                          child: Image.file(
                            fileImage!,
                            // width: 300,
                            // height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            : DottedBorder(
                strokeWidth: 2,
                color: AppColor.gray,
                dashPattern: [8, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("قم بتحميل"),
                            Text(
                              " صورة ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                              ),
                            ),
                            Text("او سحبها الى هنا")
                          ],
                        ),
                        Image.asset(AppImageAsset.upload),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
