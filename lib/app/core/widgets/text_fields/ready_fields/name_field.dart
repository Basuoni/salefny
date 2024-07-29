import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
import 'package:salefny/app/services/validation_repository.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.controller,
    this.title,
    this.height,
  });

  final TextEditingController controller;
  final String? title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final validator = ValidationRepository();

    return CustomTextField(
      title: title ?? tr.yourName,
      textInputType: TextInputType.name,
      controller: controller,
      validator: validator.hasValue,
      height: height,
    );
  }
}