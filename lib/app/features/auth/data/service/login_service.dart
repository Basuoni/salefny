import 'dart:io';

import 'package:salefny/app/core/api_helpers/dio_client.dart';
import 'package:salefny/app/core/api_helpers/dio_providers.dart';
import 'package:salefny/app/core/api_helpers/exceptions.dart';
import 'package:salefny/app/core/data/locale/user_pref.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/core/utils/keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  final client = ref.watch(dioClientProvider);
  return LoginService(client);
});

class LoginService {
  final DioClient client;

  LoginService(this.client);

  Future<void> login({
    required String url,
    required String email,
    required String password,
  }) async {
    await UserPrefs.setServerUrl(url);
    final res = await client.post(
      '/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    if (res.statusCode != HttpStatus.ok) {
      final data = res.data as Json;
      throw ApiExceptionMessage(data[Keys.msg] as String);
    }
  }
}
