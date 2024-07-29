
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/generated/style_atoms.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required this.otpController,
  });

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: PinCodeTextField(
          length: 6,
          autoFocus: true,
          cursorColor: AppColors.primary,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          textStyle: context.regular20Primary.copyWith(
            height: 1.6,
          ),
          onChanged: (value) {
            print(value);
          },
          controller: otpController,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(4),
            borderWidth: 1,
            // activeBorderWidth: 1,
            // inactiveBorderWidth: 1,
            fieldHeight: 50,
            fieldWidth: 50,
            activeFillColor: AppColors.white,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.primaryLight,
            inactiveFillColor: AppColors.white,
            selectedColor: AppColors.primary,
            selectedFillColor: AppColors.primaryLight,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          appContext: context,
        ),
      ),
    );
  }
}
