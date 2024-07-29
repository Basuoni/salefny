import 'package:salefny/app/core/utils/constants.dart';
import 'package:flutter/material.dart';

extension NumExtension on num {
  Widget get h => SizedBox(height: toDouble());

  Widget get w => SizedBox(width: toDouble());
}

class Height extends StatelessWidget {
  const Height(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class Width extends StatelessWidget {
  const Width(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Constants.defaultPadding5,
      width: width,
    );
  }
}
