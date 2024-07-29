import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/shimmer/shimmer_box.dart';
import 'package:salefny/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imgUrl,
    this.placeholderPath,
    this.fit,
    this.width = 213,
    this.height = 167,
    this.borderRadius,
  });

  final double height;
  final double width;

  final String imgUrl;
  final String? placeholderPath;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ??
          const BorderRadius.all(Radius.circular(Constants.borderRadius4)),
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        height: height,
        width: width,
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(Constants.borderRadius4),
                ),
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(Constants.borderRadius4),
                ),
            color: AppColors.white,
          ),
          child: ShimmerBox(
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(Constants.borderRadius4),
                ),
            child: Image.asset(
              placeholderPath ?? Assets.imagesServerError,
            ),
          ),
        ),
        errorWidget: (context, url, error) {
          // todo add error image
          return SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              Assets.imagesServerError,
              fit: BoxFit.cover,
              height: height,
              width: width,
            ),
          );
        },
      ),
    );
  }
}
