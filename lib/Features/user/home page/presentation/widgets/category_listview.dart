import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/approutes.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../linkapi.dart';
import '../../controllers/home_page_controller.dart';
import '../../data/models/categories_model.dart';

class ListCategoriesHome extends GetView<HomePageController> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          int selectedCat = index;
          return CategoriesItem(
            selectedCat: selectedCat,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class CategoriesItem extends GetView<HomePageController> {
  const CategoriesItem(
      {super.key, required this.categoriesModel, required this.selectedCat});
  final CategoriesModel categoriesModel;
  final int selectedCat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (categoriesModel.categoriesName == "المطاعم") {
          Get.toNamed(AppRoute.pharmaciesView, arguments: {
            "type": "restaurant",
            "pageTitle": "المطاعم",
            "searchHint": "ابحث  باسم المطعم...",
          });
        } else if (categoriesModel.categoriesName == "الصيدليات") {
          Get.toNamed(AppRoute.pharmaciesView, arguments: {
            "type": "pharmacy",
            "pageTitle": "الصيدليات",
            "searchHint": "ابحث  باسم الصيدلية...",
          });
        } else if (categoriesModel.categoriesName == "السوبر ماركت") {
          Get.toNamed(AppRoute.pharmaciesView, arguments: {
            "type": "supermarket",
            "pageTitle": "السوبر ماركت",
            "searchHint": "ابحث  باسم السوبر ماركت...",
          });
        } else if (categoriesModel.categoriesName == "التسوق") {
          Get.toNamed(AppRoute.pharmaciesView, arguments: {
            "type": "store",
            "pageTitle": "التسوق",
            "searchHint": "ابحث  باسم المكان...",
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.fithColor,
        ),
        height: 75,
        width: Get.width * 0.209,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              width: 30,
              height: 30,
            ),
            const SizedBox(height: 6),
            Text(
              categoriesModel.categoriesName.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
