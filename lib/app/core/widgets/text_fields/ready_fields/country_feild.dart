// import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
// import 'package:salefny/app/features/common/auth/data/validation_repository.dart';
// import 'package:salefny/generated/assets.dart';
// import 'package:salefny/generated/translations.g.dart';
// import 'package:flutter/material.dart';
//
// class CountryField extends StatelessWidget {
//   CountryField({
//     super.key,
//     required this.onTap,
//     required this.selectedCountry,
//   });
//
//   final String selectedCountry;
//   final VoidCallback onTap;
//   final controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final validator = ValidationRepository();
//
//     return CustomTextField.viewer(
//       title: tr.your_country,
//       hintText: tr.your_country,
//       prefixIconPath: Assets.iconsCountry,
//       suffixIconPath: Assets.iconsArrowDown,
//       textInputType: TextInputType.name,
//       text: selectedCountry,
//       onPress: onTap,
//       validator: validator.hasValue,
//     );
//   }
// }
//
// class CountrySearchField extends StatelessWidget {
//   const CountrySearchField({
//     super.key,
//     required this.controller,
//     this.onChange,
//     this.hint,
//   });
//
//   final TextEditingController controller;
//   final void Function(String value)? onChange;
//   final String? hint;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomTextField(
//       hintText: hint ?? tr.search_with_country_name,
//       prefixIconPath: Assets.iconsCountry,
//       textInputType: TextInputType.name,
//       autofocus: true,
//       controller: controller,
//       onChange: onChange,
//     );
//   }
// }
