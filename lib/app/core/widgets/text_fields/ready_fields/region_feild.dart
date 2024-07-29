// import 'package:salefny/app/core/widgets/text_fields/custom_text_field.dart';
// import 'package:salefny/app/features/common/auth/data/validation_repository.dart';
// import 'package:salefny/generated/assets.dart';
// import 'package:salefny/generated/translations.g.dart';
// import 'package:flutter/material.dart';
//
// class RegionField extends StatelessWidget {
//   RegionField({
//     super.key,
//     required this.onTap,
//     required this.selectedRegion,
//   });
//
//   final String selectedRegion;
//   final VoidCallback onTap;
//   final controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final validator = ValidationRepository();
//
//     return CustomTextField.viewer(
//       title: tr.your_region,
//       hintText: tr.your_region,
//       suffixIconPath: Assets.iconsArrowDown,
//       prefixIconPath: Assets.iconsHome,
//       textInputType: TextInputType.name,
//       text: selectedRegion,
//       onPress: onTap,
//       validator: validator.hasValue,
//     );
//   }
// }
//
// class RegionSearchField extends StatelessWidget {
//   const RegionSearchField({
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
//       hintText: tr.search_with_region_name,
//       prefixIconPath: Assets.iconsHome,
//       textInputType: TextInputType.name,
//       autofocus: true,
//       controller: controller,
//       onChange: onChange,
//     );
//   }
// }
