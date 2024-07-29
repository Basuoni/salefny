import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
import 'package:salefny/app/services/validation_repository.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: tr.email,
      // prefixIconPath: Assets.iconsEmail,
      textInputType: TextInputType.emailAddress,
      controller: controller,
      validator: Validation.validateEmail,
    );
  }
}
