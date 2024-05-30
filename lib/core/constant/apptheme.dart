import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: "Alkatra",
        color: AppColor.primaryColor),
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
    elevation: 0,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),

  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
  // useMaterial3: true,
  // primarySwatch: AppColor.primaryColor,
  fontFamily: "Almarai",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyMedium: TextStyle(
          height: 2,
          color: AppColor.gray,
          fontWeight: FontWeight.bold,
          fontSize: 12)),
);

ThemeData themeArabic = ThemeData(
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
