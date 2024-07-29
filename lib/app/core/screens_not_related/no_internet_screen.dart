import 'package:salefny/app/core/enums/internet_status.dart';
import 'package:salefny/app/core/widgets/buttons/custom_button.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/services/internet_connection_service.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class NoInternetScreen extends StatefulWidget {
  NoInternetScreen({
    super.key,
    required this.isLoading,
    required this.onRetry,
  });

  final VoidCallback onRetry;
  bool isLoading;

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    InternetConnectionService.event.on<ConnectionStatus>().listen((event) {
      if (event == ConnectionStatus.connected) widget.onRetry();
    });
    super.initState();
  }

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
                child: SvgPicture.asset(Assets.imagesNoInternetConnection),
              ),
              const Height(32),
              Text(
                tr.noInternet,
                style: context.medium16TextMain,
              ),
              const Height(8),
              Text(
                tr.checkInternetConnection,
                style: context.medium14TextSub,
              ),
              const Height(32),
              CustomButton(
                title: tr.globals.tryAgain,
                onPress: () {
                  widget.isLoading = true;
                  setState(() {});
                  widget.onRetry();
                },
                isLoading: widget.isLoading,
              ),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
