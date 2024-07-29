import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salefny/app/services/validation_repository.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.controller,
    this.title,
    this.hint,
    this.maxValue,
    this.autofocus = false,
    this.prefixIconPath,
    this.onChange,
    this.onActionPressed,
    this.textInputAction,
  }) : isOptional = false;

  const NumberField.optional({
    super.key,
    required this.controller,
    this.title,
    this.hint,
    this.maxValue,
    this.autofocus = false,
    this.prefixIconPath,
    this.onChange,
    this.onActionPressed,
    this.textInputAction,
  }) : isOptional = true;

  final bool isOptional;
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final double? maxValue;
  final bool autofocus;
  final String? prefixIconPath;
  final ValueChanged<int>? onChange;
  final ValueChanged<int?>? onActionPressed;
  final TextInputAction? textInputAction;

  bool get isRequired => !isOptional;

  @override
  Widget build(BuildContext context) {
    final validator = ValidationRepository();

    return CustomTextField(
      title: title,
      textInputType: TextInputType.number,
      controller: controller,
      hintText: hint,
      autofocus: autofocus,
      onActionPressed: (value) {
        if (onActionPressed != null) {
          onActionPressed!.call(int.tryParse(value ?? '0') ?? 0);
        }
      },
      textInputAction: textInputAction,
      prefixIconPath: prefixIconPath,
      validator: isRequired ? validator.hasValue : null,
      onChange: (value) {
        if (onChange != null) {
          onChange!.call(int.tryParse(value) ?? 0);
        }
      },
      formatters: [
        ArabicToEnglishFormatter(),
        DecimalFormatter(),
        if (maxValue != null) MaxValueFormatter(maxValue!),
      ],
    );
  }
}

class ArabicToEnglishFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue,) {
    String newText = newValue.text;
    final arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩', '٫'];
    final english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];

    for (int i = 0; i < arabic.length; i++) {
      newText = newText.replaceAll(arabic[i], english[i]);
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      ),
    );
  }
}

class DecimalFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue,) {
    final newText = newValue.text;
    final exp = RegExp(r'^\d*\.?\d*$');
    if (!exp.hasMatch(newText)) {
      return oldValue;
    }

    return newValue;
  }
}

class MaxValueFormatter extends TextInputFormatter {
  final double maxValue;

  const MaxValueFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue,) {
    final newText = double.tryParse(newValue.text) ?? 0;
    if (newText > maxValue) return oldValue;
    return newValue;
  }
}
