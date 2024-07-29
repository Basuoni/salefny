import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppBoxDecoration {
  static final defaultDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(4),
    boxShadow: [
      BoxShadow(
        color: AppColors.boxShadow.withOpacity(.05),
        spreadRadius: 3,
        blurRadius: 4,
      ),
    ],
  );
}
