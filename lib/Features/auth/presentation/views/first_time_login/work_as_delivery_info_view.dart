import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/class/handlingdataview.dart';
import '../../../controller/first_time_login/work_as_delivary_controller.dart';
import '../../widgets/custombuttomauth.dart';
import '../../widgets/customtextbody.dart';
import '../../widgets/customtexttitle.dart';
import '../../widgets/first_time_login/work_as_delivary_dropdowns.dart';
import '../../../../../core/shared/defult_custom_image_selection_widget.dart';
import '../../widgets/first_time_login/work_as_delivary_text_label.dart';
import '../../widgets/logoauth.dart';

class WorkAsDelivaryInfoView extends StatelessWidget {
  const WorkAsDelivaryInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorkAsDelivaryControllerImp controller =
        Get.put(WorkAsDelivaryControllerImp());

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
                      title: 'ابدأ العمل كدليفرى',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                        text: 'سجل باقى بياناتك واعثر على فرص عمل جديدة!'),
                    const SizedBox(height: 20),
                    GetBuilder<WorkAsDelivaryControllerImp>(
                      builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WorkAsDelivaryDropdowns(controller: controller),
                            const WorkAsDelivaryTextLabel(
                              text: "صورة المركبة:",
                            ),
                            DefultCustomImageSelectionWidget(
                              fileImage: controller.fileImageTypeVichele,
                              onTap: () {
                                controller.showOpitionImageVehicle();
                              },
                              onDelete: () {
                                controller.deleteImageVehicle();
                              },
                            ),
                            const WorkAsDelivaryTextLabel(
                              text: "صورة البطاقة الشخصية :",
                            ),
                            DefultCustomImageSelectionWidget(
                              fileImage: controller.fileImageDelivaryId,
                              onTap: () {
                                controller.showOpitionImageDelivaryId();
                              },
                              onDelete: () {
                                controller.deleteImageDelivaryId();
                              },
                            ),
                            const WorkAsDelivaryTextLabel(
                              text: "صورة رخصة القياده :",
                            ),
                            DefultCustomImageSelectionWidget(
                              fileImage: controller.fileImageDrivingLicense,
                              onTap: () {
                                controller.showOpitionImageDrivingLicense();
                              },
                              onDelete: () {
                                controller.deleteImageDrivingLicense();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomButtonAuth(
                      text: 'التالى ',
                      onPressed: () {
                        controller.goToLocationAccess();
                      },
                      width: double.infinity,
                    ),
                    const SizedBox(height: 10),
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
