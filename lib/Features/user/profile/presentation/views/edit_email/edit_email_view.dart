import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/class/handlingdataview.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/functions/validinput.dart';
import '../../../../../auth/presentation/widgets/custombuttomauth.dart';
import '../../../../../auth/presentation/widgets/customtextbody.dart';
import '../../../../../auth/presentation/widgets/customtextform.dart';
import '../../../../../auth/presentation/widgets/customtexttitle.dart';
import '../../../controllers/edit_email/edit_email_controller.dart';

class EditEmailView extends StatelessWidget {
  const EditEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditEmailControllerImp());

    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: GetBuilder<EditEmailControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.key,
            child: ListView(
              children: [
                const LogoAuth(isText: true, text: "تعديل البريد الالكترونى"),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextTitleAuth(
                        title: "تعديل البريد الالكترونى",
                      ),
                      const SizedBox(height: 10),
                      const CustomTextBodyAuth(
                          text: "قم بادخال عنوان البريد الالكتروتى الجديد"),
                      const SizedBox(height: 20),
                      CustomTextFormAuth(
                        hintText: "البريد الالكترونى الجديد",
                        lableText: "البريد الالكترونى الجديد",
                        iconData: Icons.email,
                        myController: controller.newEmail,
                        validator: (value) {
                          return validinput(
                              val: value!, min: 5, max: 100, type: "email");
                        },
                      ),
                      CustomButtonAuth(
                        text: "تاكيد",
                        width: double.infinity,
                        onPressed: () {
                          controller.sendVerificationCode();
                        },
                      ),
                    ],
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
