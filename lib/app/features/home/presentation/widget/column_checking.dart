import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';

class ColumnChecking extends StatelessWidget {
  const ColumnChecking(
      {super.key,
      required this.widget,
      required this.title,
      required this.subText});

  final Widget widget;
  final String title;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget,
        const Height(10),
        Text(title, style: context.medium16Black),
        const Height(10),
        Text(subText, style: context.regular12TextSub),
      ],
    );
  }
}
