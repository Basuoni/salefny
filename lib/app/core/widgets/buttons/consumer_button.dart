import 'package:salefny/app/core/models/custom_state.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerButton extends ConsumerWidget {
  // const ConsumerButton({super.key});

  final String title;
  final double width;
  final double height;
  final Border? border;
  final bool isDisabled;
  final Color borderColor;
  final Color? titleColor;
  final double? titleSize;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final VoidCallback onPress;
  final Color prefixIconColor;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final VoidCallback? onDisabledPressed;
  final CustomState<bool> stateProvider;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      title: title,
      width: width,
      height: height,
      border: border,
      onPress: onPress,
      textStyle: textStyle,
      titleSize: titleSize,
      titleColor: titleColor,
      isDisabled: isDisabled,
      borderColor: borderColor,
      buttonColor: buttonColor,
      borderRadius: borderRadius,
      prefixIconPath: prefixIconPath,
      suffixIconPath: suffixIconPath,
      prefixIconColor: prefixIconColor,
      onDisabledPressed: onDisabledPressed,
      isLoading: ref.watch(stateProvider.provider),
    );
  }

  const ConsumerButton({
    required this.title,
    required this.onPress,
    this.isDisabled = false,
    required this.stateProvider,
    this.width = double.infinity,
    this.titleColor = AppColors.white,
    this.prefixIconColor = Colors.white,
    this.buttonColor = AppColors.primary,
    this.borderColor = Colors.transparent,
    this.height = Constants.buttonHeight54,
    this.onDisabledPressed,
    this.prefixIconPath,
    this.suffixIconPath,
    this.borderRadius,
    this.titleSize,
    this.textStyle,
    this.border,
  });
}
