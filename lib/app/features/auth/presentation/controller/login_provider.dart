import 'package:salefny/app/core/api_helpers/exceptions.dart';
import 'package:salefny/app/core/models/custom_state.dart';
import 'package:salefny/app/core/utils/show_message.dart';
import 'package:salefny/app/features/auth/data/service/login_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = Provider<_LoginLogic>(
  (ref) => _LoginLogic(
    ref: ref,
    service: ref.watch(loginServiceProvider),
  ),
);

class _LoginLogic extends _LoginStates {
  _LoginLogic({
    required super.ref,
    required this.service,
  });

  final LoginService service;

  final formKey = GlobalKey<FormState>();
  final serverURLController = TextEditingController(
    text: kDebugMode ? 'http://restaurant.tenant.kashierapp.com' : '',
  );
  final emailController = TextEditingController(
    text: kDebugMode ? 'employee@app.com' : '',
  );
  final passwordController = TextEditingController(
    text: kDebugMode ? '12345678' : '',
  );

  Future<bool> login() async {
    try {
      isLoading.state = true;
      await service.login(
        url: serverURLController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      isLoading.state = false;
      return true;
    } on ApiException catch (e) {
      setErrorMessage(e.toString());
    } finally {
      isLoading.state = false;
    }
    return false;
  }
}

class _LoginStates {
  final ProviderRef ref;
  final CustomState<bool> isLoading;

  _LoginStates({required this.ref}) : isLoading = CustomState(ref, false);
}
