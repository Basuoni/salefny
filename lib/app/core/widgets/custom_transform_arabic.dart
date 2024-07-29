import 'dart:math';

import 'package:salefny/app/core/data/locale/lang_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTransformArabic extends ConsumerWidget {
  const CustomTransformArabic({
    super.key,
    required this.child,
    this.transformInArabic = true,
  });

  final Widget child;
  final bool transformInArabic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Transform.rotate(
      angle: isArabic
          ? (transformInArabic ? 180 * pi / 180 : 0)
          : (!transformInArabic ? 180 * pi / 180 : 0),
      child: child,
    );
  }
}
