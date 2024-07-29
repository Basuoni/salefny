import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCardImageView extends StatelessWidget {
  const CustomCardImageView({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
  });

  final double height;
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      Radius.circular(
        Constants.borderRadius4,
      ),
    );
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CustomCachedNetworkImage(
          imgUrl: imageUrl,
          height: height,
          width: double.infinity,
        ),
      ),
    );
  }
}
