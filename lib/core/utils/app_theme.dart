import 'package:traval/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Popins',
    primaryColor: Colors.black,
    canvasColor: AppColors.secondaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.appColor,
    ),
    brightness: Brightness.light,
  );
}
