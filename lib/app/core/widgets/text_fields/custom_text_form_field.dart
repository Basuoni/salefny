import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/themes/app_text_field_border_styles.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/buttons/custom_ink_well.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.title,
    this.suffixIconPath,
    this.keyboardType,
    this.isPassword = false,
    this.readOnly = false,
    this.isEnabled = true,
    this.onPressed,
    this.prefixIconPath,
    this.validator,
    this.onChanged,
    this.textStyle,
    this.minLines,
    this.maxLines,
    this.autofocus = false,
    this.suffixIconOnPressed,
    this.controller,
    this.prefixIconColor,
    this.hintTextStyle,
    this.maxLength,
  });

  final String? hint;
  final String? suffixIconPath;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final bool isEnabled;
  final String? prefixIconPath;
  final Function()? onPressed;
  final String? title;
  final int? minLines;
  final int? maxLines;
  final bool autofocus;
  final Function()? suffixIconOnPressed;
  final Color? prefixIconColor;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(
              left: Constants.defaultPadding5 / 2,
              bottom: Constants.defaultPadding5 / 2.5,
            ),
            child: Text(
              title!,
              style: context.regular14Black,
            ),
          ),
          const CustomSizedBox(
            height: Constants.defaultPadding5 / 4,
          ),
        ],
        TextFormField(
          controller: controller,
          autocorrect: false,
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          readOnly: readOnly,
          enabled: isEnabled,
          onTap: onPressed,
          maxLines: maxLines ?? (isPassword ? 1 : 5),
          minLines: minLines ?? 1,
          autofocus: autofocus,
          maxLength: maxLength,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          style: textStyle,
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            filled: true,
            counterText: '',
            fillColor: AppColors.white,
            hintText: hint ?? '${tr.globals.enter}$title',
            hintStyle: hintTextStyle ??
                const TextStyle(
                  color: AppColors.textPlaceholder,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding24,
              vertical: Constants.defaultPadding5 / 1.2,
            ),
            suffixIcon: (suffixIconPath != null)
                ? CustomInkWell(
                    onTap: suffixIconOnPressed ?? () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        suffixIconPath!,
                      ),
                    ),
                  )
                : null,
            prefixIcon: (prefixIconPath != null)
                ? Padding(
                    padding: const EdgeInsets.all(
                      Constants.defaultPadding5 * 2.5,
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
            focusedBorder: AppTextFieldBorderStyles.border,
            disabledBorder: AppTextFieldBorderStyles.border,
            errorBorder: AppTextFieldBorderStyles.errorBorder,
            focusedErrorBorder: AppTextFieldBorderStyles.errorBorder,
          ),
        ),
      ],
    );
  }
}

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    this.hint,
    this.title = '',
    this.keyboardType,
    this.readOnly = false,
    this.onPressed,
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
    this.onEditingComplete,
    this.textInputAction,
  });

  final String? hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final Function()? onPressed;
  final String? title;
  final int? minLines;
  final int? maxLines;
  final bool autofocus;
  final Function()? suffixIconOnPressed;
  final Color? prefixIconColor;
  final TextStyle? hintTextStyle;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;

  @override
  _CustomPasswordTextFormFieldState createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: widget.hint,
      title: widget.title,
      controller: widget.controller,
      validator: widget.validator,
      onPressed: widget.onPressed,
      maxLines: widget.minLines,
      minLines: widget.minLines,
      prefixIconColor: widget.prefixIconColor,
      onChanged: widget.onChanged,
      isPassword: isPassword,
      autofocus: widget.autofocus,
      hintTextStyle: widget.hintTextStyle,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      suffixIconOnPressed: () {
        isPassword = !isPassword;
        setState(() {});
      },
      suffixIconPath:
          isPassword ? Assets.svgEyePassword : Assets.svgEyeNotPassword,
      readOnly: widget.readOnly,
    );
  }
}
