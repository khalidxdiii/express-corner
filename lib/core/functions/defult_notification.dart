import 'package:get/get.dart';

import '../constant/colors.dart';

defultNotification({required String title, required String body}) {
  Get.snackbar(
    title,
    body,
    backgroundColor: AppColor.fithColor,
    colorText: AppColor.primaryColor,
  );
}
