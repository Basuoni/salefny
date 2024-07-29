import 'dart:async';
import 'dart:developer';

import 'package:salefny/app/core/extensions/navigators.dart';
import 'package:salefny/app/core/widgets/app_bar/no_app_bar.dart';
import 'package:salefny/app/core/widgets/buttons/consumer_button.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:salefny/app/features/auth/presentation/controller/login_provider.dart';
import 'package:salefny/app/router/auto_router.gr.dart';
import 'package:salefny/app/services/validation_repository.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginProvider);
    return Scaffold(
      appBar: const NoAppBar(),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Height(16),
            Text(
              tr.login,
              style: context.medium22Black,
            ),
            const Height(8),
            Text(
              tr.enterYourInformationToOpenYourAccount,
              style: context.regular16TextSub,
            ),
            // const Height(24),
            // CustomTextFormField(
            //   title: tr.serverURL,
            //   suffixIconPath: Assets.svgScanQr,
            //   validator: Validation.isLinkValid,
            //   maxLines: 1,
            //   controller: controller.serverURLController,
            //   suffixIconOnPressed: () {
            //     context.push(ScanQRRoute(
            //       onQRViewCreated: (res) {
            //         log(name: 'QRView created', res);
            //         controller.serverURLController.text = res;
            //       },
            //     ));
            //   },
            // ),
            const Height(24),
            // CustomTextFormField(
            //   title: tr.phoneNumber,
            //   validator: Validation.validateEgpNumber,
            //   controller: controller.emailController,
            // ),

            const Height(24),
            CustomPasswordTextFormField(
              title: tr.password,
              validator: Validation.emptyValidator,
              controller: controller.passwordController,
            ),
            const Height(24),
            ConsumerButton(
              stateProvider: controller.isLoading,
              title: tr.login,
              onPress: () async {
                if (controller.formKey.currentState!.validate()) {
                  final res = await controller.login();
                  if (res) {
                    unawaited(context.pushAndPopAll(const HomeRoute()));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
