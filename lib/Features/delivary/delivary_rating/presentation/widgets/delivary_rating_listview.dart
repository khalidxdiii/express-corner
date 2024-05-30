import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/delivary_ratings_controller.dart';
import 'delivary_rating_card.dart';

class DelivaryRatingListview extends GetView<DelivaryRatingsControllerImp> {
  const DelivaryRatingListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.delivaryRatingsModel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return DelivaryRatingCard(
          userName: controller.delivaryRatingsModel[index].userName.toString(),
          cityName: controller.delivaryRatingsModel[index].userCity.toString(),
          feedBack:
              "${controller.delivaryRatingsModel[index].ratingComment.toString()} .",
          userRating: double.parse(controller
              .delivaryRatingsModel[index].ratingUserRating
              .toString()),
        );
      },
    );
  }
}
