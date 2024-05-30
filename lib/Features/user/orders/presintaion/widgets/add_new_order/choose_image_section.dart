import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../controllers/add_order_controller.dart';

class AddOrderChooseImageSection extends StatelessWidget {
  const AddOrderChooseImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddOrderControllerImp>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("المرفقات"),
            const SizedBox(height: 5),
            controller.file != null
                ? Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            controller.file!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColor.fithColor,
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: AppColor.primaryColor,
                              size: 18,
                            ),
                            onPressed: () {
                              controller.deleteImage();
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.fithColor,
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(
                        //     color: AppColor.primaryColor, width: 1),
                      ),
                      height: 100,
                      width: 100,
                      child: IconButton(
                        onPressed: () {
                          controller.showOpitionImage();
                        },
                        icon: const Icon(Icons.add),
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
