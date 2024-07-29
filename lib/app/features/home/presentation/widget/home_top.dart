import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:salefny/app/core/extensions/navigators.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/padding/custom_padding.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: context.width,
      decoration: const BoxDecoration(
        color: kcPrimaryColor,
      ),
      child: Padding(
        padding: CustomPadding.mediumPadding(context),
        child: Row(
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: kcWhiteColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/011/675/374/small_2x/man-avatar-image-for-profile-png.png")))),
            Width(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Mohamed Elsherif!",
                  style: context.medium16Black,
                ),
                Height(10),
                Text(
                  "Senior UI UX Designer",
                  style: context.regular12Black,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.push(const NotificationRoute());
              },
              child: SvgPicture.asset(
                Assets.svgNotificationBing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
