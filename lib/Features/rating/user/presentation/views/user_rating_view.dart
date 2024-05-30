import 'package:express_corner/core/class/handlingdataview.dart';
import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:express_corner/core/shared/defult_button.dart';
import 'package:express_corner/core/shared/defult_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/defult_rating_bar.dart';
import '../../controllers/rating_controller.dart';

class UserRatingView extends StatelessWidget {
  const UserRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RatingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<RatingControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.asset(AppImageAsset.rating, width: 160, height: 160),
                  const SizedBox(height: 10),
                  const Text(
                    "تقييمك يهمنا!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "شاركنا تجربتك لتساعدنا في تحسين خدمة التوصيل",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DefultRatingBar(
                    initialRating: 0,
                    onRatingUpdate: (rating) {
                      controller.onRatingUpdate(rating);
                    },
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "اترك تقييمك",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomDefultTextForm(
                    hintText: "رأيك يهمنا",
                    lableText: "رأيك يهمنا",
                    iconData: Icons.rate_review,
                    myController: controller.comment,
                    maxLines: 5,
                    removePrefixIcon: true,
                    isHideSuffixIcon: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  CustomDefultButton(
                    text: "حفظ",
                    onPressed: () {
                      controller.addRating();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
