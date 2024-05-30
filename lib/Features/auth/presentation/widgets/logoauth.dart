import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth(
      {super.key,
      this.isText = false,
      this.text = "",
      this.isBack = true,
      this.actionText = "",
      this.onTapAction});
  final bool? isText;
  final String? text;
  final String? actionText;
  final bool? isBack;
  final void Function()? onTapAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
        child: isText != false
            ? Stack(
                alignment: Alignment.center,
                children: [
                  isBack == true
                      ? Positioned(
                          right: 0,
                          top: 35,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 5,
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "رجوع",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),

                  ///
                  actionText != ""
                      ? Positioned(
                          left: 0,
                          top: 35,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: GestureDetector(
                              onTap: onTapAction,
                              child: Text(
                                actionText.toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Image.asset(
                AppImageAsset.logo,
                height: 100,
              ),
      ),
    );
  }
}
