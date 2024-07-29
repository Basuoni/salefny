import 'dart:async';

import 'package:salefny/app/core/data/locale/lang_pref.dart';
import 'package:salefny/app/core/themes/app_text_field_border_styles.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/services/validation_repository.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class InternationalPhoneNumberView extends StatefulWidget {
  const InternationalPhoneNumberView({
    super.key,
    required this.controller,
    required this.onCountryChanged,
    this.onChanged,
    this.disableLengthCheck = false,
    this.validator,
    this.autofocus = false,
  });

  final TextEditingController controller;
  final ValueChanged<Country>? onCountryChanged;
  final ValueChanged<PhoneNumber>? onChanged;
  final bool disableLengthCheck;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final bool autofocus;

  @override
  State<InternationalPhoneNumberView> createState() =>
      _InternationalPhoneNumberViewState();
}

class _InternationalPhoneNumberViewState
    extends State<InternationalPhoneNumberView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntlPhoneField(
          textAlignVertical: TextAlignVertical.center,
          autofocus: widget.autofocus,
          style: TextStyle(
            height: 1.5,
          ),
          dropdownTextStyle: context.regular14TextPlaceholder,
          decoration: InputDecoration(
            hintText: tr.enter_your_phone_number,
            hintStyle: context.regular12TextPlaceholder.copyWith(
              height: 1.5,
            ),
            counterText: '',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
              vertical: Constants.defaultPadding / 1.2,
            ),
            border: AppTextFieldBorderStyles.border,
            enabledBorder: AppTextFieldBorderStyles.border,
            focusedBorder: AppTextFieldBorderStyles.border,
            disabledBorder: AppTextFieldBorderStyles.border,
            errorBorder: AppTextFieldBorderStyles.errorBorder,
            focusedErrorBorder: AppTextFieldBorderStyles.errorBorder,
          ),
          invalidNumberMessage: tr.validation.invalidField,
          disableLengthCheck: widget.disableLengthCheck,
          pickerDialogStyle: PickerDialogStyle(
            searchFieldPadding: const EdgeInsets.all(5),
            searchFieldInputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: tr.searchCountry,
              prefixIcon: const Icon(Icons.search),
              border: AppTextFieldBorderStyles.border,
              enabledBorder: AppTextFieldBorderStyles.border,
              disabledBorder: AppTextFieldBorderStyles.border,
            ),
            countryCodeStyle: context.regular14,
            countryNameStyle: context.regular14,
          ),
          textAlign: TextAlign.start,
          initialCountryCode: 'SA',
          controller: widget.controller,
          onCountryChanged: widget.onCountryChanged,
          onChanged: (value) {
            widget.onChanged?.call(value);
            setState(() {});
            if (value.number.length > 7 && value.number[0] == '0') {
              widget.controller.text = value.number.replaceFirst('0', '');
              widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length),
              );
            }
          },
          validator: widget.validator ??
              (s) => Validation.validatePhoneNumber(s?.number),
        ),
      ),
    );
  }
}
