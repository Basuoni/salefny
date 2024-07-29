import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:salefny/app/services/validation_repository.dart';

class RequiredField extends StatelessWidget {
  const RequiredField({
    super.key,
    required this.controller,
    this.title,
    this.height,
    this.hint,
  });

  final TextEditingController controller;
  final String? title;
  final String? hint;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final validator = ValidationRepository();
    return CustomTextField(
      title: title,
      hintText: hint ?? title,
      controller: controller,
      validator: validator.hasValue,
      height: height,
    );
  }
}
