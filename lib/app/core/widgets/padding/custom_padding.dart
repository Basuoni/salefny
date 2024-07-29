import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:flutter/cupertino.dart';

class CustomPadding {
  static EdgeInsetsGeometry smallPadding(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.width * 0.03);
  }

  static EdgeInsetsGeometry mediumPadding(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.width * 0.06);
  }

  static EdgeInsetsGeometry largePadding(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.width * 0.08);
  }

  static EdgeInsetsGeometry massivePadding(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.width * 0.12);
  }
}
