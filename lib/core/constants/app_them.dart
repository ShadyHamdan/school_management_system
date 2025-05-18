import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

ThemeData englishThem = ThemeData(
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w900,
      height: 2,
      color: greyColor,
    ),
    displayLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      color: blackColortext,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      // color: AppColor.grey,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      //color: AppColor.grey,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
ThemeData arabicthem = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      //fontWeight: FontWeight.bold,
      fontSize: 12,
      //  color: AppColor,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      //  color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      // color: AppColor.grey,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      // color: AppColor.grey,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
