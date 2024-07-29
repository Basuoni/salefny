import 'package:salefny/app/core/data/locale/lang_pref.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontFamily: getFontFamily,
          ),
          centerTitle: false,
        ),
        primaryColor: AppColors.primary,
        fontFamily: getFontFamily,
        scaffoldBackgroundColor: AppColors.white,
        platform: TargetPlatform.iOS,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondary,
          primary: AppColors.primary,
        ),
      );
}
