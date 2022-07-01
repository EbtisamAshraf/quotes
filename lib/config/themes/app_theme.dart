import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      fontFamily: AppStrings.fontFamily,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black , fontSize: 18)),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)));
}
