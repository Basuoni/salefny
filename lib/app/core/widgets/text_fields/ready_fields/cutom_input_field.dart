import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:salefny/app/services/validation_repository.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.title,
    this.hintText,
    required this.controller,
    this.prefixIconPath,
    this.textInputType,
  });

  final TextEditingController controller;
  final String? title;
  final String? hintText;
  final String? prefixIconPath;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: title,
      prefixIconPath: prefixIconPath,
      textInputType: textInputType,
      controller: controller,
      hintText: hintText,
      validator: Validation.emptyValidator,
    );
  }
}
