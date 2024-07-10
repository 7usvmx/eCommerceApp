import 'package:flutter/material.dart';
import '../colors.dart';

//! English version App theme

ThemeData themeDataEnglish = ThemeData(
  fontFamily: "taj",
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.mainColor,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      height: 2,
      color: TextColors.detailsColor,
    ),
  ),
);

//! English version App theme

ThemeData themeDataArabic = ThemeData(
  fontFamily: "taj",
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.mainColor,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      height: 2,
      color: TextColors.detailsColor,
    ),
  ),
);
