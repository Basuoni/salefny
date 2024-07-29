import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/utils/show_message.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerButton extends StatelessWidget {
  final double? borderRadius;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const ShimmerButton({
    super.key,
    this.borderRadius,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryLight.withOpacity(0.4),
      highlightColor: const Color(0xFFD6E5F5),
      child: GestureDetector(
        onTap: onPressed ??
            () {
              setWarningMessage(tr.pleaseWaitForProcessing);
            },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          width: width ?? 220,
          height: height ?? 48,
        ),
      ),
    );
  }
}
