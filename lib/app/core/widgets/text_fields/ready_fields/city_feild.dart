// import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
// import 'package:salefny/app/services/validation_repository.dart';
// import 'package:salefny/generated/assets.dart';
// import 'package:salefny/generated/translations.g.dart';
// import 'package:flutter/material.dart';
//
// class CityField extends StatelessWidget {
//   CityField({
//     super.key,
//     required this.onTap,
//     required this.selectedCity,
//   });
//
//   final String selectedCity;
//   final VoidCallback onTap;
//   final controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final validator = ValidationRepository();
//
//     return CustomTextField.viewer(
//       title: tr.yourCity,
//       hintText: tr.yourCity,
//       suffixIconPath: Assets.iconsArrowDown,
//       prefixIconPath: Assets.iconsHome,
//       textInputType: TextInputType.name,
//       text: selectedCity,
//       onPress: onTap,
//       validator: Validation.emptyValidator,
//     );
//   }
// }
//
// class CitySearchField extends StatelessWidget {
//   const CitySearchField({
//     super.key,
//     required this.controller,
//     this.onChange,
//   });
//
//   final TextEditingController controller;
//   final void Function(String value)? onChange;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomTextField(
//       hintText: tr.search_with_city_name,
//       prefixIconPath: Assets.iconsHome,
//       textInputType: TextInputType.name,
//       autofocus: true,
//       controller: controller,
//       onChange: onChange,
//     );
//   }
// }
