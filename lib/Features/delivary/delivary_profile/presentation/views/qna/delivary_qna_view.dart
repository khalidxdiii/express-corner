import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/qnr/qnr_controller.dart';
import '../../widgets/qna/delivary_qna_listview.dart';

class DelivaryQnAView extends StatelessWidget {
  const DelivaryQnAView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryQnrController());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const LogoAuth(
              isText: true,
              text: "الاسئلة المتكررة",
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelivaryQnAListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
