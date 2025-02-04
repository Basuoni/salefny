import 'package:flutter/material.dart';

extension MediaQueryValue on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  void requestFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node);
}
