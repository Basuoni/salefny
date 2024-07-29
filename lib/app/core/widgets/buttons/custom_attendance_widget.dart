import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class CustomAttendanceButton extends StatelessWidget {
  final String text;
  final bool isSecondary;
  final IconData? icon;
  final bool visibleIcon;
  final Color colorButton;
  final Color colorText;
  final double borderRadius;
  final double width;
  final double fontSizeText;
  final GestureTapCallback? onTap;

  const CustomAttendanceButton(
      {super.key,
        required this.text,
        this.isSecondary = false,
        this.visibleIcon = false,
        this.icon,
        this.width = double.infinity,
        this.colorButton = kcPrimaryColor,
        this.colorText = Colors.white,
        this.borderRadius = 12.0,
        this.fontSizeText = 14,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: isSecondary ? Border.all(color: colorButton, width: 2.5) : null,
            color: isSecondary ? null : colorButton),
        child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: visibleIcon,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(icon, color: colorButton),
                  ),
                ),
                Text(text,
                    style: TextStyle(
                        color: isSecondary ? colorButton : colorText, fontSize: fontSizeText, fontWeight: FontWeight.bold)),
              ],
            )),
      ),
    );
  }
}
