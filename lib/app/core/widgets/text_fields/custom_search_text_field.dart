import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Constants.spaceBetween12,
        horizontal: Constants.spaceBetween12 * 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow.withOpacity(.05),
            blurRadius: 4,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: CustomTextFormField(
        hint: tr.globals.search,
        prefixIconPath: Assets.svgSearch,
        controller: controller,
      ),
    );
  }
}
