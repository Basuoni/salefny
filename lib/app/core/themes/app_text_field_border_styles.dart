import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTextFieldBorderStyles {
  static OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryLight,
      width: Constants.borderWidth1_5,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.danger,
      width: Constants.borderWidth1_5,
    ),
    borderRadius: BorderRadius.circular(
      Constants.textFieldBorderRadius4,
    ),
  );
}
