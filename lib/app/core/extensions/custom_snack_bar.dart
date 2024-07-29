import 'package:salefny/app/core/data/locale/lang_pref.dart';
import 'package:salefny/app/core/enums/internet_status.dart';
import 'package:salefny/app/core/enums/snack_bar.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/services/internet_connection_service.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

extension CustomSnackBar on BuildContext {
  Color getSnackBarColor(SnackBarStatus snackBarStatus) {
    late Color bgColor;
    if (snackBarStatus == SnackBarStatus.success) {
      bgColor = AppColors.success;
    } else if (snackBarStatus == SnackBarStatus.error) {
      bgColor = AppColors.danger;
    } else {
      bgColor = AppColors.warning;
    }
    return bgColor;
  }

  Future<void> showCustomSnackBar({
    required String message,
    SnackBarStatus snackBarStatus = SnackBarStatus.error,
  }) async {
    final Color bgColor = getSnackBarColor(snackBarStatus);
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
        content: Text(
          message,
          style: TextStyle(
              fontSize: 14.0,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontFamily: getFontFamily),
        ),
      ),
    );
    return;
  }
}

extension InternetSnackBar on BuildContext {
  void initInternetListeners() {
    InternetConnectionService.event.on<ConnectionStatus>().listen((event) {
      if (event == ConnectionStatus.connected) {
        showInternetOnlineSnackBar();
      } else if (event == ConnectionStatus.disconnected) {
        showInternetOfflineSnackBar();
      } else if (event == ConnectionStatus.weak) {
        showWeakInternetSnackBar();
      }
    });
  }

  Color getSnackBarColor(SnackBarStatus snackBarStatus) {
    late Color bgColor;
    if (snackBarStatus == SnackBarStatus.success) {
      bgColor = AppColors.success;
    } else if (snackBarStatus == SnackBarStatus.error) {
      bgColor = AppColors.danger;
    } else {
      bgColor = AppColors.warning;
    }
    return bgColor;
  }

  void showInternetOfflineSnackBar() {
    final Color bgColor = getSnackBarColor(SnackBarStatus.error);
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor,
      duration: const Duration(days: 1),
      showCloseIcon: true,
      closeIconColor: AppColors.white,
      content: Text(
        tr.internet.disconnected,
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showInternetOnlineSnackBar() {
    final Color bgColor = getSnackBarColor(SnackBarStatus.success);
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
        content: Text(
          tr.internet.connected,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  void showWeakInternetSnackBar() {
    final Color bgColor = getSnackBarColor(SnackBarStatus.warning);
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
        content: Text(
          tr.internet.weak,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
