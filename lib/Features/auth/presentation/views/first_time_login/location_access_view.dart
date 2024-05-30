import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/first_time_login/location_access_controller.dart';
import '../../widgets/custombuttomauth.dart';
import '../../widgets/customtextbody.dart';
import '../../widgets/customtexttitle.dart';

class LocationAccessView extends StatelessWidget {
  const LocationAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationAccessControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: GetBuilder<LocationAccessControllerImp>(
            builder: (controller) => HandlingDataView(
              isCenter: true,
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const LogoAuth(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextTitleAuth(
                          title: 'السماح بمشاركة موقعك',
                        ),
                        const SizedBox(height: 10),
                        const CustomTextBodyAuth(
                            text:
                                'مشاركة موقعك آمنة تمامًا، ولا يتم مشاركتها مع أي شخص آخر.'),
                        const SizedBox(height: 40),
                        Center(
                            child: Image.asset(AppImageAsset.locationAccess)),
                        const SizedBox(height: 40),
                        CustomButtonAuth(
                          text: 'السماح بالمشاركة  ',
                          onPressed: () {
                            controller.updateType();
                          },
                          width: double.infinity,
                        ),
                        CustomButtonAuth(
                          text: 'تخطى فى الوقت الحالى ',
                          bgColor: AppColor.bgButtonSecColor,
                          textColor: AppColor.primaryColor,
                          onPressed: () {
                            controller.goToHome();
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
        ),
      ),
    );
  }
}
