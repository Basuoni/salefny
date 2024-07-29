import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
import 'package:salefny/app/services/validation_repository.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final validator = ValidationRepository();
    return CustomTextField(
      title: tr.password,
      isPasswordField: true,
      prefixIconPath: Assets.svgLock,
      textInputType: TextInputType.visiblePassword,
      controller: controller,
      validator: validator.validatePassword,
    );
  }
}

class NewPasswordField extends StatelessWidget {
  const NewPasswordField({
    super.key,
    required this.repassController,
    required this.passController,
  });

  final TextEditingController repassController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    final validator = ValidationRepository();
    return CustomTextField(
      title: tr.newPass,
      prefixIconPath: Assets.svgLock,
      controller: repassController,
      isPasswordField: true,
      textInputType: TextInputType.visiblePassword,
      validator: (repass) => validator.validateRePassword(
        passController.text,
        repassController.text,
      ),
    );
  }
}

class RePasswordField extends StatelessWidget {
  const RePasswordField({
    super.key,
    required this.repassController,
    required this.passController,
  });

  final TextEditingController repassController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    final validator = ValidationRepository();
    return CustomTextField(
      title: tr.repassword,
      prefixIconPath: Assets.svgLock,
      controller: repassController,
      isPasswordField: true,
      textInputType: TextInputType.visiblePassword,
      validator: (repass) => validator.validateRePassword(
        passController.text,
        repassController.text,
      ),
    );
  }
}
