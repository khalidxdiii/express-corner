import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../auth/presentation/widgets/logoauth.dart';
import '../../../controllers/contact_us/contact_us_controller.dart';
import '../../widgets/contact_us/contact_us_options.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactUsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            LogoAuth(
              isText: true,
              text: "تواصل معنا",
            ),
            ContactUsOptions(),
          ],
        ),
      ),
    );
  }
}
