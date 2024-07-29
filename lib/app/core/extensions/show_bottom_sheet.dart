import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

extension ShowBottomSheet on BuildContext {
  void showBottomSheet({
    required Widget bottomSheetBody,
    bool isScrollControlled = true,
  }) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: width,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width * .30,
                  height: 6,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.textPlaceholder,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                bottomSheetBody,
              ],
            ),
          ),
        ),
      ),
      context: this,
    );
  }
}
