
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/themes/app_text_field_border_styles.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/services/validation_repository.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    super.key,
    required this.phoneController,
    required this.onCountryChanged,
    this.initialCountry,
    this.onChanged,
    this.title,
  });

  final String? title;
  final TextEditingController phoneController;
  final ValueChanged<Country>? onCountryChanged;
  final ValueChanged<PhoneNumber>? onChanged;
  final String? initialCountry;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  FocusNode focusNode = FocusNode();

  bool get isEmpty => widget.phoneController.text.isEmpty;

  bool get isArabic => LocaleSettings.currentLocale.languageCode == 'ar';

  TextAlign get textAlign =>
      isEmpty && isArabic ? TextAlign.end : TextAlign.start;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(refreshScreen);
  }

  void refreshScreen() => setState(() {});

  bool get isFocused => focusNode.hasFocus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 2.5, bottom: 1),
              child: Text(widget.title!, style: context.medium14Black),
            ),
            const Height(1.25),
          ],
          Directionality(
            textDirection: TextDirection.ltr,
            child: IntlPhoneField(
              focusNode: focusNode,
              onTap: () => setState(() => focusNode.requestFocus()),
              showCountryFlag: false,
              style: context.regular14.copyWith(
                height: 1.7,
                color: AppColors.primary,
              ),
              textAlign: textAlign,
              dropdownIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isFocused || widget.phoneController.text.isNotEmpty
                    ? AppColors.primary
                    : AppColors.textPlaceholder,
                size: 20,
              ),
              dropdownTextStyle: context.regular14.copyWith(
                color: isFocused || widget.phoneController.text.isNotEmpty
                    ? AppColors.primary
                    : AppColors.textPlaceholder,
              ),
              flagsButtonMargin: const EdgeInsets.only(left: 14),
              dropdownIconPosition: IconPosition.trailing,
              decoration: InputDecoration(
                hintText: tr.enter_your_phone_number,
                hintStyle: context.regular14TextPlaceholder,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Constants.horizontalPadding,
                  vertical: Constants.defaultPadding / 1.2,
                ),
                counterText: '',
                border: AppTextFieldBorderStyles.border,
                enabledBorder: AppTextFieldBorderStyles.border,
                focusedBorder: AppTextFieldBorderStyles.border.copyWith(
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
                disabledBorder: AppTextFieldBorderStyles.border,
                errorBorder: AppTextFieldBorderStyles.errorBorder,
                focusedErrorBorder: AppTextFieldBorderStyles.errorBorder,
              ),
              invalidNumberMessage: tr.validation.invalidField,
              // disableLengthCheck: true,
              pickerDialogStyle: PickerDialogStyle(
                searchFieldPadding: const EdgeInsets.all(5),
                searchFieldInputDecoration: InputDecoration(
                  hintText: tr.search,
                  prefixIcon: const Icon(Icons.search),
                  border: AppTextFieldBorderStyles.border,
                  enabledBorder: AppTextFieldBorderStyles.border,
                  disabledBorder: AppTextFieldBorderStyles.border,
                ),
                countryCodeStyle: context.regular14Black,
                countryNameStyle: context.regular14Black,
              ),
              // textAlign: TextAlign.right,
              initialCountryCode: widget.initialCountry ?? 'SA',
              controller: widget.phoneController,
              validator: (s) async =>
                  ValidationRepository().validatePhoneNumber(s?.number),
              onCountryChanged: widget.onCountryChanged,
              onChanged: (value) {
                focusNode.requestFocus();
                widget.onChanged?.call(value);
                setState(() {});
                if (value.number.length > 7 && value.number[0] == '0') {
                  widget.phoneController.text =
                      value.number.replaceFirst('0', '');
                  widget.phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.phoneController.text.length),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension PhoneNumberX on PhoneNumber {
  String get fullPhone => '$countryCode$number';
}
