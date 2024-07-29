import 'package:alice/alice.dart';
import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:salefny/app/core/themes/app_theme.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:salefny/app/router/auto_router.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smartlook/flutter_smartlook.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

bool isUpdateDialogNotAppeared = true;

final AppRouter appRouter = AppRouter();
final Alice alice = Alice(
  navigatorKey: appRouter.navigatorKey,
  showInspectorOnShake: true,
  showNotification: false,
);

class POSApp extends ConsumerStatefulWidget {
  const POSApp({super.key});

  @override
  ConsumerState<POSApp> createState() => _POSAppState();
}

class _POSAppState extends ConsumerState<POSApp> {
  final smartLook = Smartlook.instance;

  @override
  void initState() {
    super.initState();
    initSmartLook();
  }

  @override
  Widget build(BuildContext context) {
    setupSystemChrome();
    // if (kDebugMode) {
    //   final dvLocale = DevicePreview.locale(context);
    //   if (dvLocale != null &&
    //       LocaleSettings.currentLocale.languageCode != dvLocale.languageCode) {
    //     Future.delayed(Duration.zero, () {
    //       ref.read(langPrefsProvider.notifier).setLang(
    //             dvLocale.languageCode == AppLocale.ar.languageCode
    //                 ? AppLocale.ar
    //                 : AppLocale.en,
    //           );
    //     });
    //   }
    //   setState(() {});
    //   log('will rebuild with ${LocaleSettings.currentLocale.languageCode}');
    // }

    return GestureDetector(
      onTap: () => context.requestFocus(FocusNode()),
      child: SmartlookRecordingWidget(
        child: MaterialApp.router(
          routerConfig: appRouter.config(
            navigatorObservers: () => [
              SentryNavigatorObserver(),
              SmartlookObserver(),
            ],
          ),
          title: 'Attendance',
          theme: AppTheme.lightTheme,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            // if (isUpdateDialogNotAppeared) checkVersion();

            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.05),
              child: child!, //DevicePreview.appBuilder(context, child),
            );
          },
        ),
      ),
    );
  }

  void setupSystemChrome() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> initSmartLook() async {
    if (kReleaseMode) {
      await smartLook.start();
      await smartLook.preferences.setProjectKey(Constants.smartLookKey);
    }
  }
}
