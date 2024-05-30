import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/first_time_login/choose_user_type_controller.dart';
import '../../widgets/coustom_chose_type.dart';
import '../../widgets/custombuttomauth.dart';
import '../../widgets/customtextbody.dart';
import '../../widgets/customtexttitle.dart';

class ChooseUserTypeView extends StatelessWidget {
  const ChooseUserTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseUserTypeControllerImp controller =
        Get.put(ChooseUserTypeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              const LogoAuth(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextTitleAuth(
                      title: 'اختر نوع حسابك',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                        text: 'اختر نوع الحساب الذي ينطبق عليك.'),
                    const SizedBox(height: 40),
                    GetBuilder<ChooseUserTypeControllerImp>(
                      builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: Row(
                          children: [
                            Expanded(
                              child: CustomChooseType(
                                text: "دليفرى",
                                image: AppImageAsset.delivary,
                                isSelected:
                                    controller.userType == "2" ? true : false,
                                onTap: () {
                                  controller.changeType("2");
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomChooseType(
                                text: "مستخدم",
                                image: AppImageAsset.user,
                                isSelected:
                                    controller.userType == "1" ? true : false,
                                onTap: () {
                                  controller.changeType("1");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomButtonAuth(
                      text: 'التالى ',
                      onPressed: () {
                        controller.goToLocationAccess();
                      },
                      width: double.infinity,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
