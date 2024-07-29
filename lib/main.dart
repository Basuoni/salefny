// ignore_for_file: body_might_complete_normally_catch_error

import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:salefny/app.dart';
import 'package:salefny/app/core/api_helpers/endpoints.dart';
import 'package:salefny/app/core/api_helpers/exceptions.dart';
import 'package:salefny/app/core/data/locale/agent_pref.dart';
import 'package:salefny/app/core/data/locale/lang_pref.dart';
import 'package:salefny/app/core/data/locale/pref.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/firebase_options.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final globalRefContainer = ProviderContainer();

Future<void> main() async {
  await runZonedGuarded(
    () async {
      await SentryFlutter.init(
        (options) async {
          options.dsn = '';
          // options.release = (await PackageInfo.fromPlatform()).version;
          // options.environment = myAppFlavor.name;
          // options.attachScreenshot = true;
        },
        appRunner: () async {
          await initServices();
          runApp(
            SentryScreenshotWidget(
              child: TranslationProvider(
                child: UncontrolledProviderScope(
                  container: globalRefContainer,
                  child: const POSApp(),
                ),
              ),
            ),
          );
        },
      );
    },
    (e, s) async {
      log(e.toString(), stackTrace: s);
      if (kReleaseMode) {
        await Sentry.captureException(e, stackTrace: s);
      }
    },
  );
}

Future<void> initServices() async {
  await SharedPrefs.init();
  await _getBaseUrl();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  /// Todo ask bas
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).catchError((e) {});
  await setInitialLang();
  await UserAgentPrefs.init();
  // InternetConnectionService.init();

  // await PushNotificationsService.init(
  //   onNavigateInApp: (type) => eventNotification.fire(type),
  //   onMessageInApp: (notificationType) {
  //     globalRefContainer.read(newNotificationInApp.notifier).state = true;
  //     globalRefContainer.invalidate(notificationProvider);
  //     log(name: 'onMessageInApp', 'new');
  //   },
  //   fcmTokenUpdate: (token) {
  //     log('fcmTokenUpdate: $token');
  //     globalRefContainer.read(authServicesProvider).updateToken(token: token);
  //   },
  // ).catchError((e) {});
}

Future<void> setInitialLang() async {
  try {
    final prefs = SharedPrefs.instance;
    final isArabicLang = prefs.getBool(isKeyArabic);
    if (isArabicLang == null) {
      final devLocale = LocaleSettings.useDeviceLocale();
      await prefs.setBool(isKeyArabic, devLocale.languageCode == 'ar');
    } else {
      LocaleSettings.setLocale(isArabicLang ? AppLocale.ar : AppLocale.en);
    }
  } on Exception catch (e, s) {
    log(e.toString(), stackTrace: s);
  }
}

Future<void> _getBaseUrl() async {
  try {
    return;

    /// Todo => remove this line Before Production
    final dio = Dio();
    final res = await dio.get(Endpoints.getBaseUrl);
    final data = (res.data as Map<String, dynamic>)['data'];
    log(data.toString(), name: 'baseUrl');
    if (data == null) return;
    await SharedPrefs.instance.setString(
      'baseUrl',
      (data as Json)['url'] as String,
    );
  } on ApiException catch (e, s) {
    log(e.toString(), stackTrace: s);
  }
}
