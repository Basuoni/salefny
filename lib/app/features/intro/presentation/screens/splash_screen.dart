import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:salefny/app/core/extensions/navigators.dart';
import 'package:salefny/app/router/auto_router.gr.dart';
import 'package:salefny/generated/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.pushAndPopAll(const LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          Assets.svgAppLogo,
          width: context.width * 0.5,
          height: context.width * 0.5,
        ),
      ),
    );
  }
}
