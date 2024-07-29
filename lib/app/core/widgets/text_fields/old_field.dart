import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/themes/app_text_field_border_styles.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/buttons/custom_ink_well.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/generated/style_atoms.dart';

class CustomTextFormFieldOld extends StatelessWidget {
  const CustomTextFormFieldOld({
    super.key,
    required this.hint,
    this.title,
    this.suffixIconPath,
    this.keyboardType,
    this.readOnly = false,
    this.onPressed,
    this.prefixIconPath,
    this.validator,
    this.onChanged,
    this.minLines,
    this.maxLines,
    this.autofocus = false,
    this.suffixIconOnPressed,
    this.controller,
    this.prefixIconColor,
    this.hintTextStyle,
    this.maxLength,
    this.onFieldSubmitted,
  })  : isPassword = false,
        isObscure = false;

  const CustomTextFormFieldOld.password({
    super.key,
    required this.hint,
    this.title,
    this.prefixIconPath,
    this.isObscure = false,
    this.onPressed,
    this.validator,
    this.onChanged,
    this.autofocus = false,
    this.suffixIconOnPressed,
    this.controller,
    this.prefixIconColor,
    this.hintTextStyle,
    this.onFieldSubmitted,
    this.maxLength,
  })  : isPassword = true,
        minLines = 1,
        maxLines = 1,
        keyboardType = TextInputType.text,
        readOnly = false,
        suffixIconPath = null;

  final String hint;
  final String? suffixIconPath;
  final TextInputType? keyboardType;
  final bool isObscure;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final String? prefixIconPath;
  final Function()? onPressed;
  final String? title;
  final int? minLines;
  final int? maxLines;
  final bool autofocus;
  final Function()? suffixIconOnPressed;
  final Color? prefixIconColor;
  final TextStyle? hintTextStyle;
  final int? maxLength;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: EdgeInsets.only(
              left: Constants.defaultPadding / 2,
              bottom: Constants.defaultPadding / 2.5,
            ),
            child: Text(
              title!,
              style: context.medium14Black,
            ),
          ),
          const CustomSizedBox(
            height: Constants.defaultPadding / 4,
          ),
        ],
        TextFormField(
          controller: controller,
          autocorrect: false,
          obscureText: isObscure,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          readOnly: readOnly,
          onTap: onPressed,
          maxLines: isPassword ? 1 : maxLines ?? 5,
          minLines: minLines ?? 1,
          autofocus: autofocus,
          maxLength: maxLength,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          onFieldSubmitted: onFieldSubmitted,
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            filled: true,
            counterText: '',
            fillColor: AppColors.white,
            hintText: hint,
            hintStyle: hintTextStyle ??
                const TextStyle(
                  color: AppColors.textPlaceholder,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
              vertical: Constants.defaultPadding / 1.2,
            ),
            suffixIcon: (suffixIconPath != null)
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: Constants.defaultPadding,
                      left: Constants.defaultPadding / 4,
                    ),
                    child: CustomInkWell(
                      onTap: suffixIconOnPressed ?? () {},
                      child: SvgPicture.asset(
                        suffixIconPath!,
                      ),
                    ),
                  )
                : isPassword
                    ? CustomInkWell(
                        onTap: suffixIconOnPressed ?? () {},
                        child: SvgPicture.asset('assets/icons/eye.svg'),
                      )
                    : null,
            prefixIcon: (prefixIconPath != null)
                ? Padding(
                    padding: const EdgeInsets.all(
                      Constants.defaultPadding * 2.5,
                    ),
                    child: SvgPicture.asset(
                      prefixIconPath!,
                      colorFilter: ColorFilter.mode(
                        prefixIconColor ?? AppColors.textPlaceholder,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
            border: AppTextFieldBorderStyles.border,
            enabledBorder: AppTextFieldBorderStyles.border,
            focusedBorder: AppTextFieldBorderStyles.border.copyWith(
              borderSide:
                  const BorderSide(color: AppColors.primary, width: 1.5),
            ),
            disabledBorder: AppTextFieldBorderStyles.border,
            errorBorder: AppTextFieldBorderStyles.errorBorder,
            focusedErrorBorder: AppTextFieldBorderStyles.errorBorder,
          ),
        ),
      ],
    );
  }
}
