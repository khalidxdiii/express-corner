// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../constant/colors.dart';
import '../functions/fcmconfig.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  // ThemeData AppTheme = themeEnglish;
  // ThemeData AppTheme = themeArabic;
  ThemeData AppTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    useMaterial3: true,
    // primarySwatch: AppColor.primaryColor,
    fontFamily: "Almarai",
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyMedium: TextStyle(
          height: 2,
          color: AppColor.gray,
          fontWeight: FontWeight.bold,
          fontSize: 12),
    ),
  );

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    // AppTheme = langcode == 'ar' ? themeArabic : themeEnglish;
    AppTheme = langcode == 'ar' ? themeArabic : themeArabic;
    Get.changeTheme(AppTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.snackbar(
        "تنبيه",
        "الرجاء تشخيل خدمه تحديد الموقع",
        backgroundColor: AppColor.fithColor,
        colorText: AppColor.primaryColor,
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
          "تنبيه",
          "الرجاء اعطاء صلاحيه  تحديد الموقع للتطبيق",
          backgroundColor: AppColor.fithColor,
          colorText: AppColor.primaryColor,
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
        "تنبيه",
        "لا يمكن استعمال التطبيق بدون اللوكيشن",
        backgroundColor: AppColor.fithColor,
        colorText: AppColor.primaryColor,
      );
    }
  }

  @override
  void onInit() {
    requestPermissionNotifacation();
    fcmconfig();
    requestPerLocation();
    String? sharedPrefLAng = myServices.sharedPreferences.getString("lang");
    AppTheme = themeArabic;
    if (sharedPrefLAng == 'ar') {
      language = const Locale('ar');
      AppTheme = themeArabic;
    } else if (sharedPrefLAng == 'en') {
      language = const Locale('en');
      AppTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      AppTheme = themeEnglish;
    }
    super.onInit();
  }
}
