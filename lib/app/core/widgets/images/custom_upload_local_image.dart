import 'dart:io';

import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/widgets/buttons/custom_ink_well.dart';
import 'package:flutter/material.dart';

class CustomUploadLocalImage extends StatelessWidget {
  const CustomUploadLocalImage({
    super.key,
    required this.imageFile,
    this.height,
    this.width,
    this.onClose,
    this.showClose = true,
  });

  final File imageFile;
  final double? height;
  final double? width;
  final GestureTapCallback? onClose;
  final bool showClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 105,
      width: width ?? 133,
      child: Stack(
        children: [
          Container(
            height: height ?? 105,
            width: width ?? 133,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showClose)
            Positioned(
              top: 0,
              right: 0,
              child: CustomInkWell(
                onTap: onClose ?? () {},
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  // todo: add close icon
                  // child: Center(
                  //   child: SvgPicture.asset(AssetsManger.closeIconPath),
                  // ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
