import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

extension ShowAlertDialog on BuildContext {
  Future<void> showCustomAlertDialog({
    required Widget dialog,
  }) async {
    return showDialog(
      context: this,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        content: dialog,
      ),
    );
  }
}
