import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/widgets/app_bar/default_app_bar.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/features/notification/presentation/widget/notification_item.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emptyState = true;
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: DefaultAppBar(
        title: tr.notifications,
      ),
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: kcWhiteColor,
        ),
        child: !emptyState
            ? ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const NotificationItem(
                  color: kcRedColor,
                ),
              )
            : SizedBox.expand(
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    SvgPicture.asset(Assets.svgNoNotification),
                    Text(
                      tr.noNotifications,
                      style: context.medium20Primary,
                    ),
                    const Height(8),
                    Text(
                      tr.youHaveNoNotificationsYet,
                      style: context.regular16Black,
                    ),
                    const Height(8),
                    Text(
                      tr.pleaseComeBackLater,
                      style: context.regular16Black,
                    ),
                    const Expanded(flex: 4, child: SizedBox()),
                  ],
                ),
              ),
      ),
    );
  }
}
