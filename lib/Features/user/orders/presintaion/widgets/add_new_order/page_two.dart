import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/app_icons_assets.dart';
import '../../../../../../core/constant/approutes.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/shared/defult_button.dart';
import '../../../controllers/add_order_controller.dart';

class PageTwo extends GetView<AddOrderControllerImp> {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderControllerImp>(
      builder: (controller) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.adressData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.chooseShippingAddress(
                      id: controller.adressData[index].addressId!,
                      userAddressLong: double.parse(
                          controller.adressData[index].addressLong!),
                      userAddresslat: double.parse(
                          controller.adressData[index].addressLat!),
                      addressUserCity:
                          controller.adressData[index].addressCity!,
                      addressUserDetails:
                          controller.adressData[index].addressDetails!,
                      addressUserGov: controller.adressData[index].addressGov!,
                      addressUserType:
                          controller.adressData[index].addressType!,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.addressId ==
                                    controller.adressData[index].addressId
                                ? AppColor.primaryColor
                                : Colors.white, // specify border color here
                            width: 1, // specify border width here
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          title: Text(
                            controller.adressData[index].addressType.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            controller.adressData[index].addressDetails
                                .toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                          leading: SvgPicture.asset(AppIconsAsset.location),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0, left: 40.0, bottom: 20),
            child: CustomDefultButton(
              text: "اضافة عنوان جديد",
              onPressed: () {
                Get.toNamed(AppRoute.addressAdd);
              },
              isSecButton: true,
              // isShowIcon: true,
              // icon: AppIconsAsset.add,
            ),
          )
        ],
      ),
    );
  }
}
