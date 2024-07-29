import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/shimmer/shimmer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final double width;
  final double height;
  final VoidCallback onPress;
  final VoidCallback? onDisabledPressed;
  final BorderRadiusGeometry? borderRadius;
  final bool isDisabled;
  final bool isLoading;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Border? border;
  final Color borderColor;
  final Color prefixIconColor;
  final double? titleSize;

  const CustomButton({
    super.key,
    required this.title,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.primary,
    this.borderColor = Colors.transparent,
    this.width = double.infinity,
    this.height = Constants.buttonHeight54,
    required this.onPress,
    this.onDisabledPressed,
    this.textStyle,
    this.borderRadius,
    this.prefixIconPath,
    this.suffixIconPath,
    this.border,
    this.titleSize,
    this.isDisabled = false,
    this.isLoading = false,
    this.prefixIconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Material(
          color: AppColors.white,
          child: isLoading
              ? ShimmerButton(width: width, height: height)
              : GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (isDisabled) {
                      onDisabledPressed?.call();
                    } else {
                      onPress.call();
                    }
                  },
                  child: Container(
                    width: width,
                    height: height,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isDisabled ? AppColors.textBorders : buttonColor,
                      borderRadius: borderRadius ?? BorderRadius.circular(12),
                      border: border ??
                          Border.all(
                            color: isDisabled
                                ? AppColors.textBorders
                                : borderColor,
                          ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (prefixIconPath != null) ...[
                          SvgPicture.asset(
                            prefixIconPath!,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              isDisabled
                                  ? AppColors.textBorders
                                  : prefixIconColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 10)
                        ],
                        Text(
                          title,
                          style: textStyle ??
                              TextStyle(
                                color: isDisabled
                                    ? AppColors.textSub
                                    : titleColor,
                                // fontWeight: FontWeight.w300,
                                fontSize: titleSize ?? 16,
                              ),
                        ),
                        if (suffixIconPath != null) ...[
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            suffixIconPath!,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              isDisabled
                                  ? AppColors.textBorders
                                  : prefixIconColor,
                              BlendMode.srcIn,
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class CustomButtonOutlined extends CustomButton {
  const CustomButtonOutlined({
    super.key,
    required super.title,
    required super.onPress,
    super.titleColor = AppColors.primary,
    super.buttonColor = Colors.white,
    super.prefixIconColor = AppColors.primary,
    super.width = double.infinity,
    super.height = Constants.buttonHeight54,
    super.onDisabledPressed,
    super.border,
    super.borderColor = AppColors.primary,
    super.textStyle,
    super.borderRadius,
    super.prefixIconPath,
    super.suffixIconPath,
    super.titleSize,
    super.isDisabled = false,
    super.isLoading = false,
  });
}

class CustomTextButton extends CustomButton {
  const CustomTextButton({
    super.key,
    required super.title,
    super.titleColor = AppColors.primary,
    super.buttonColor = Colors.white,
    super.width = double.infinity,
    super.height = Constants.buttonHeight54,
    required super.onPress,
    super.onDisabledPressed,
    super.textStyle,
    super.borderRadius,
    super.prefixIconPath,
    super.suffixIconPath,
    super.border,
    super.borderColor = Colors.white,
    super.titleSize,
    super.isDisabled = false,
    super.isLoading = false,
  });
}
