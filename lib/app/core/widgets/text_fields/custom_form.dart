import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    required this.child,
    this.formKey,
  });

  final Widget child;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Form(
        key: formKey,
        child: child,
      ),
    );
  }
}
