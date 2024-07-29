import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salefny/generated/style_atoms.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final bool readOnly;
  final bool autofocus;
  final Color? enabledBorderColor;
  final TextEditingController controller;
  final TextAlign? textAlign;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChange;
  final void Function(String? value)? onActionPressed;
  final VoidCallback? onPress;
  final VoidCallback? onSuffixIconPressed;
  final int? maxLength;
  final TextInputType? textInputType;
  final bool isPasswordField;
  final Color? fillColor;
  final Color? textInputColor;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? formatters;
  final double? height;

  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    required this.controller,
    this.textAlign,
    this.prefixIconPath,
    this.suffixIconPath,
    this.validator,
    this.onChange,
    this.onActionPressed,
    this.formatters,
    this.autofocus = false,
    this.onPress,
    this.enabledBorderColor,
    this.maxLength,
    this.textInputType,
    this.onEditingComplete,
    this.isPasswordField = false,
    this.onSuffixIconPressed,
    this.fillColor,
    this.textInputColor,
    this.textInputAction,
    this.readOnly = false,
    this.height,
  });

  CustomTextField.viewer({
    super.key,
    this.title,
    this.hintText,
    required String text,
    this.textAlign,
    this.prefixIconPath,
    this.suffixIconPath,
    this.validator,
    this.onChange,
    this.onActionPressed,
    this.autofocus = false,
    this.onPress,
    this.enabledBorderColor,
    this.onEditingComplete,
    this.maxLength,
    this.textInputType,
    this.isPasswordField = false,
    this.onSuffixIconPressed,
    this.fillColor,
    this.textInputColor,
    this.textInputAction,
    this.formatters,
    this.height,
  })  : controller = TextEditingController(text: text),
        readOnly = true;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPasswordField;
    focusNode = widget.readOnly ? null : FocusNode();
    focusNode?.addListener(refreshScreen);
  }

  void refreshScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode?.requestFocus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: context.regular16TextMain,
            ),
            const SizedBox(height: 5),
          ],
          SizedBox(
            height: widget.height,
            child: TextFormField(
              keyboardType: widget.textInputType,
              inputFormatters: widget.formatters ?? inputFormatters,
              autofocus: widget.autofocus,
              textInputAction: widget.textInputAction,
              focusNode: focusNode,
              textAlignVertical: widget.height != null
                  ? TextAlignVertical.top
                  : TextAlignVertical.center,
              readOnly: widget.readOnly,
              expands: widget.height != null,
              maxLines: widget.height != null ? null : 1,
              minLines: widget.height != null ? null : 1,
              obscuringCharacter: '*',
              onTapOutside: (_) => setState(() => focusNode?.unfocus()),
              style: context.regular14.copyWith(
                height: 1.7,
                color: widget.textInputColor ?? inputTextColor,
              ),
              controller: widget.controller,
              cursorColor: AppColors.primary,
              decoration: inputDecoration,
              obscureText: obscureText,
              validator: widget.validator,
              onEditingComplete: widget.onEditingComplete,
              textAlign: widget.textAlign ?? TextAlign.start,
              onFieldSubmitted: widget.onActionPressed,
              onTap: () => setState(() {
                widget.onPress?.call();
                focusNode?.requestFocus();
              }),
              onChanged: (v) => setState(() {
                widget.onChange?.call(v);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Color get iconColor =>
      isFocused || (widget.controller.text.isNotEmpty && !widget.readOnly)
          ? AppColors.primary
          : AppColors.textPlaceholder;

  List<TextInputFormatter> get inputFormatters =>
      [LengthLimitingTextInputFormatter(widget.maxLength)];

  Color get inputTextColor => AppColors.primary;

  bool get isFocused => focusNode != null && focusNode!.hasFocus;

  OutlineInputBorder _buildOutlineInputBorder([
    Color color = AppColors.textBorders,
  ]) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(12),
      );

  InputDecoration get inputDecoration => InputDecoration(
        contentPadding: widget.height != null
            ? const EdgeInsets.symmetric(vertical: 10)
            : EdgeInsets.zero,
        errorMaxLines: 3,
        filled: true,
        fillColor: widget.fillColor ?? AppColors.white,
        enabledBorder: _buildOutlineInputBorder(
          widget.enabledBorderColor ?? AppColors.textBorders,
        ),
        border: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(AppColors.danger),
        focusedBorder: _buildOutlineInputBorder(
          focusNode != null ? AppColors.primary : AppColors.textBorders,
        ),
        hintText: widget.hintText ?? widget.title,
        hintStyle: context.regular14TextPlaceholder,
        prefix: widget.prefixIconPath == null ? const Width(10) : null,
        prefixIcon: widget.prefixIconPath == null
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0).copyWith(right: 7),
                    child: SvgPicture.asset(
                      widget.prefixIconPath!,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: 1.5,
                    height: 16,
                    color: AppColors.textPlaceholder,
                  ),
                  const Width(7),
                ],
              ),
        suffixIcon: widget.isPasswordField
            ? InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => setState(() => obscureText = !obscureText),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    obscureText
                        ? 'assets/icons/eye_pass_hidden.svg'
                        : 'assets/icons/eye_pass.svg',
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      iconColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : widget.suffixIconPath != null
                ? GestureDetector(
                    onTap: widget.onSuffixIconPressed,
                    child: SvgPicture.asset(
                      widget.suffixIconPath!,
                      width: 7.6,
                      colorFilter: ColorFilter.mode(
                        iconColor,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : null,
      );

  @override
  void dispose() {
    focusNode?.dispose();
    focusNode?.removeListener(refreshScreen);
    super.dispose();
  }
}
