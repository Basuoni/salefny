import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/buttons/custom_button.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.dec,
    required this.textAction,
    required this.onPress,
  });

  final String title;
  final String dec;
  final String textAction;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.regular18Primary),
          const Height(8),
          Text(dec, style: context.regular12TextMain),
          const Height(24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  buttonColor: AppColors.white,
                  titleColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  title: tr.close,
                  onPress: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(title: textAction, onPress: onPress),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
