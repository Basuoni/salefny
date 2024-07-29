import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/utils/store_redirect.dart';
import 'package:salefny/app/core/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

///Todo edit screen

class NewVersionAlert extends StatelessWidget {
  final double? scale;
  final bool isRequired;

  const NewVersionAlert({
    super.key,
    this.scale,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      title: WillPopScope(
        onWillPop: () async => !isRequired,
        child: const SizedBox.shrink(),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Lottie.asset(
          //   Assets.lottieUpdateAvailable,
          //   height: context.width * 0.71,
          //   width: context.width * 0.71,
          // ),
          Text(
            'tr.new_update_available',
            textAlign: TextAlign.center,
            style: context.medium20Primary,
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'tr.update_now',
            onPress: storeRedirect,
            titleSize: 16,
          ),
          if (!isRequired) const SizedBox(width: 20),
          const SizedBox(height: 12),
          if (!isRequired)
            CustomButtonOutlined(
              title: 'tr.update_later',
              titleSize: 16,
              onPress: () => Navigator.pop(context),
            ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
