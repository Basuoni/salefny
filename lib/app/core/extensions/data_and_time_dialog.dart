import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

extension CustomDateAndTime on BuildContext {
  //Date picker
  Future<DateTime?> customDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    bool isPast = false,
  }) {
    initialDate = initialDate ?? DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: isPast
          ? DateTime(
              DateTime.now().year - 15,
            )
          : firstDate ?? initialDate,
      lastDate: lastDate ??
          DateTime(
            DateTime.now().year + 15,
          ),
      confirmText: tr.confirm,
      cancelText: tr.close,
    );
  }

  //time picker
  Future<TimeOfDay?> timePickerDialog({
    required BuildContext context,
  }) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      confirmText: tr.confirm,
      cancelText: tr.close,
    );
  }
}
