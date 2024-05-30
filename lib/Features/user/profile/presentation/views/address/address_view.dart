import 'package:express_corner/Features/auth/presentation/widgets/logoauth.dart';
import 'package:express_corner/Features/empthy%20status/presentation/views/status_success_view.dart';
import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/app_icons_assets.dart';
import 'package:express_corner/core/constant/approutes.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../core/functions/custom_show_dialog.dart';
import '../../../controllers/address/view_controller.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAdressControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(right: 16, left: 16, bottom: 25, top: 10),
        child: CustomDefultButton(
          text: "اضافة عنوان جديد",
          isShowIcon: true,
          icon: AppIconsAsset.add,
          onPressed: () {
            Get.toNamed(AppRoute.addressAddMap);
          },
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ViewAdressControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                const LogoAuth(
                  isText: true,
                  text: "عناوينى",
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.adressData.length,
                    itemBuilder: (context, index) {
                      return AddressCardItem(
                        itemIndex: index,
                        title: controller.adressData[index].addressType!,
                        body:
                            "${controller.adressData[index].addressDetails!} - ${controller.adressData[index].addressCity!} - ${controller.adressData[index].addressGov!}",
                      );
                    },
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

class AddressCardItem extends GetView<ViewAdressControllerImp> {
  const AddressCardItem({
    super.key,
    required this.title,
    required this.body,
    required this.itemIndex,
  });
  final String title;
  final String body;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          icon: Icons.delete,
          borderRadius: BorderRadius.circular(8),
          flex: 3,
          backgroundColor: Colors.red,
          onPressed: (context) {
            showbottomSheet(
              title: "حذف العنوان",
              body: "هل تود حذف عنوان البيت؟",
              onConfirm: () {
                controller.delete(
                    addressID: controller.adressData[itemIndex].addressId!);
                Get.off(StatusSuccessView(
                  title: "تم حذف العنوان بنجاح!",
                  body: "تم حذف عنوانك البيت بنجاح .",
                  onPressed: () {
                    Get.offAllNamed(AppRoute.homeLayoutView);
                  },
                ));
              },
            );
          },
        ),
      ]),
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16),
                height: 112,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                        aspectRatio: 1.3,
                        child: Image.asset(AppImageAsset.addressSimple)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            body,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 110,
              width: 7,
              decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
            )
          ],
        ),
      ),
    );
  }
}
