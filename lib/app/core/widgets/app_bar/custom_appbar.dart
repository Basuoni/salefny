import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? titleWidget;
  final bool backButton;

  @override
  final Size preferredSize;

  const CustomAppBar(
      {super.key, this.actions, this.titleWidget, this.backButton = true})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kcWhiteColor,
      ),
      backgroundColor: kcWhiteColor,
      foregroundColor: kcWhiteColor,

      // iconTheme: const IconThemeData(color: kcDarkGreyColor),
      actions: actions,
      // elevation: 3,
      title: Text(titleWidget ?? '', style: context.medium16Black),
      centerTitle: true,
      leading: backButton
          ? Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(Assets.svgBackIcon),
              ),
            )
          : Container(),
    );
  }
}
