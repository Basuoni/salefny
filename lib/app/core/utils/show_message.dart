import 'package:salefny/app.dart';
import 'package:salefny/app/core/enums/snack_bar.dart';
import 'package:salefny/app/core/extensions/custom_snack_bar.dart';
import 'package:flutter/material.dart';

BuildContext get currContext => appRouter.navigatorKey.currentContext!;

void setMessage(
  String message, {
  SnackBarStatus snackBarStatus = SnackBarStatus.error,
}) {
  currContext.showCustomSnackBar(
    snackBarStatus: snackBarStatus,
    message: message,
  );
}

void setErrorMessage(
  String message, {
  SnackBarStatus snackBarStatus = SnackBarStatus.error,
}) {
  currContext.showCustomSnackBar(
    message: message,
  );
}

void setSuccessfullyMessage(String message) {
  currContext.showCustomSnackBar(
    snackBarStatus: SnackBarStatus.success,
    message: message,
  );
}

void setWarningMessage(String message) {
  currContext.showCustomSnackBar(
    snackBarStatus: SnackBarStatus.warning,
    message: message,
  );
}
