import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/widgets/buttons/custom_ink_well.dart';
import 'package:salefny/app/core/widgets/custom_transform_arabic.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String heroTag;
  final bool isPopEnabled;
  final bool hasBackButton;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final List<Widget>? actions;

  const DefaultAppBar({
    super.key,
    this.title = '',
    this.heroTag = '',
    this.isPopEnabled = true,
    this.hasBackButton = true,
    this.backgroundColor = AppColors.white,
    this.onBackPressed,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  VoidCallback get onExitPressed {
    return widget.onBackPressed ??
        () {
          if (widget.isPopEnabled) {
            Navigator.of(context).pop();
          } else {
            // context.showWaitToast();
          }
        };
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      automaticallyImplyLeading: false,
      leadingWidth: 70,
      centerTitle: true,
      scrolledUnderElevation: 0,
      title: Text(
        widget.title,
        style: context.medium14TextMain,
      ),
      titleSpacing: 0,
      toolbarHeight: 65,
      actions: widget.actions,
      leading: (widget.hasBackButton
          ? CustomInkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.spaceBetween12 * 2,
                ),
                child: CustomTransformArabic(
                  child: SvgPicture.asset(
                    Assets.svgBackIcon,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textMain,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            )
          : null),
    );
  }
}
