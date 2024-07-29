import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerBox({
    super.key,
    this.height = 8,
    this.width,
    this.borderRadius,
    this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.primaryLight,
      highlightColor: highlightColor ?? const Color(0xFFF9FAFB),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderRadius ??
              BorderRadius.circular(height > 24 ? 8 : height / 4),
        ),
        child: child,
      ),
    );
  }
}
