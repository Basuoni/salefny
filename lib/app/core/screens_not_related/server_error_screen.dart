import 'package:salefny/app/core/widgets/buttons/custom_button.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ServerErrorScreen extends StatefulWidget {
  ServerErrorScreen({
    super.key,
    required this.isLoading,
    required this.onRetry,
  });

  late bool isLoading;
  final VoidCallback onRetry;

  @override
  _ServerErrorState createState() => _ServerErrorState();
}

class _ServerErrorState extends State<ServerErrorScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              SizedBox(
                width: 280,
                height: 280,
                child: SvgPicture.asset(Assets.imagesServerError),
              ),
              const Height(32),
              Text(
                tr.errorInServer,
                style: context.medium16TextMain,
                textAlign: TextAlign.center,
              ),
              const Height(8),
              Text(
                tr.errorInServerDescription,
                textAlign: TextAlign.center,
                style: context.medium14TextSub,
              ),
              const Height(32),
              CustomButton(
                /// todo navigate to home
                title: tr.returnToHome,
                onPress: () {
                  widget.isLoading = true;
                  setState(() {});
                  // context.pushAndPopAll(HomeRoute());
                  widget.onRetry();
                },
                isLoading: widget.isLoading,
              ),
              const Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
