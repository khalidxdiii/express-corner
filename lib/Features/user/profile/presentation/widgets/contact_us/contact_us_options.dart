import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../../core/constant/app_icons_assets.dart';
import '../../../../../../core/constant/approutes.dart';
import '../../../controllers/contact_us/contact_us_controller.dart';
import '../select_option.dart';

class ContactUsOptions extends GetView<ContactUsControllerImp> {
  const ContactUsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SelectOption(
            text: "رقم الواتساب",
            icon: AppIconsAsset.whatsApp,
            isWidget: true,
            width: 25.0,
            height: 25.0,
            widget: const Text(
              "201253652364+",
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              controller.openWhatsAppChat(
                phoneNumber: '201205345887',
                // message: 'Hello, this is a test message!',
              );
            },
          ),
          SelectOption(
            text: "رقم الهاتف",
            icon: AppIconsAsset.callCalling,
            isWidget: true,
            width: 20.0,
            height: 20.0,
            widget: const Text(
              "01201985652",
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              controller.openCallApp('01201985652');
            },
          ),
          SelectOption(
            text: "الفيسبوك",
            icon: AppIconsAsset.facebook,
            width: 25.0,
            height: 25.0,
            onTap: () {
              controller.openFacebookProfile('eng.khaledabdo');
              // controller.openFacebookPage('OpenAI');
            },
          ),
          SelectOption(
            text: "البريد الالكترونى",
            icon: AppIconsAsset.gmail,
            width: 20.0,
            height: 20.0,
            onTap: () {
              controller.sendNewEmail(
                toEmail: 'eng.khaledando25@gmail.com',
                subject: '',
                body: '',
              );
            },
          ),
          SelectOption(
            text: "تقديم مشكلة او شكوى",
            icon: AppIconsAsset.report,
            width: 20.0,
            height: 20.0,
            onTap: () {
              Get.toNamed(AppRoute.addReport);
            },
          ),
        ],
      ),
    );
  }
}
