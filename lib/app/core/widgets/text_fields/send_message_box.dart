import 'package:flutter/material.dart';
import 'package:salefny/app/core/extensions/media_query_value.dart';

class LongInputTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String text)? onChanged;
  final String? hintText;
  final void Function(String text)? onEnterPressed;
  final double? height;
  final int? maxLines;
  final int? maxLength;

  const LongInputTextField({
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.maxLength,
    this.onEnterPressed,
    this.onChanged,
    this.height,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? context.height * 0.20,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength,
        maxLines: maxLines,
        enableSuggestions: false,
        textInputAction: onEnterPressed == null
            ? TextInputAction.newline
            : TextInputAction.send,
        onSubmitted: onEnterPressed,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          counter: const Offstage(),
          hintStyle: const TextStyle(
            color: Color(0xFFC4C4C4),
            fontSize: 15,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
