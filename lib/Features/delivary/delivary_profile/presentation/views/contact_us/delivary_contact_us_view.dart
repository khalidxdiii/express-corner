import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../auth/presentation/widgets/logoauth.dart';
import '../../../controllers/contact_us/contact_us_controller.dart';
import '../../widgets/contact_us/delivary_contact_us_options.dart';

class DelivaryContactUsView extends StatelessWidget {
  const DelivaryContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryContactUsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            LogoAuth(
              isText: true,
              text: "تواصل معنا",
            ),
            DelivaryContactUsOptions(),
          ],
        ),
      ),
    );
  }
}
