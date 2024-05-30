import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/custom_show_dialog.dart';
import '../../../../../core/shared/defult_button.dart';
import '../../controllers/profile_controller.dart';
import '../widgets/profile_options.dart';
import '../widgets/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<ProfileControllerImp>(
        builder: (controller) => HandlingDataView(
          isCenter: true,
          statusRequest: controller.statusRequest!,
          widget: ListView(
            shrinkWrap: true,
            children: [
              const LogoAuth(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Column(
                  children: [
                    UserInfo(),
                    SizedBox(height: 15),
                    ProfileOptions(),
                    SizedBox(height: 20),

                    // CustomDefultButton(
                    //   text: "تسجيل الخروج",
                    //   isShowIcon: true,
                    //   onPressed: () {
                    //     showbottomSheet();
                    //   },
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
