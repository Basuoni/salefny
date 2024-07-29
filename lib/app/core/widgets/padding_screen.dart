import 'package:flutter/material.dart';

class PaddingScreen extends StatelessWidget {
  const PaddingScreen({
    super.key,
    required this.child,
    this.horizontal = 16.0,
    this.vertical = 0.0,
  });

  final double horizontal;
  final double vertical;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: child,
    );
  }
}
