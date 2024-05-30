import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/open_Image_controller.dart';

class CustomDefultOpenImage extends StatelessWidget {
  const CustomDefultOpenImage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OpenImageController());
    return GetBuilder<OpenImageController>(
      builder: (controller) => Center(
        child: CachedNetworkImage(
          imageUrl: controller.imageUrl,
        ),
      ),
    );
  }
}
