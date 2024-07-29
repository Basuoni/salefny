import 'dart:developer';

import 'package:salefny/app.dart';
import 'package:salefny/app/core/api_helpers/dio_client.dart';
import 'package:salefny/app/core/api_helpers/endpoints.dart';
import 'package:salefny/app/core/api_helpers/logout_interceptor.dart';
import 'package:salefny/app/core/data/locale/agent_pref.dart';
import 'package:salefny/app/core/data/locale/lang_pref.dart';
import 'package:salefny/app/core/data/locale/pref.dart';
import 'package:salefny/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: '', /// baseUrl Saved in SharedPrefs
        validateStatus: (_) => true,
        followRedirects: true,
        headers: {
          'accept': 'application/json',
        },
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        logPrint: (error) => log(error.toString(), name: 'API'),
      ),
      if (kDebugMode) alice.getDioInterceptor(),
      UnitsDioInterceptor(),
    ]);
    dio.addSentry();
    return dio;
  },
);

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(
    dio: ref.read(dioProvider),
    langPrefs: ref.watch(langPrefsProvider.notifier),
    userAgent: ref.watch(userAgentProvider),
  ),
);
