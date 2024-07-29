import 'dart:ui';

import 'package:salefny/app/core/data/locale/pref.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String get lang => isArabic ? 'ar' : 'en';

String get getFontFamily => isArabic ? 'Expo' : 'Poppins';

bool get isArabic {
  return SharedPrefs.instance.getBool(isKeyArabic) ??
      (LocaleSettings.currentLocale.languageCode == AppLocale.ar.languageCode);
}

Locale get appLocale => isArabic ? const Locale('ar') : const Locale('en');
const isKeyArabic = 'lang';
final langPrefsProvider = StateNotifierProvider((ref) {
  final prefs = SharedPrefs.instance;
  final state =
      prefs.getBool(isKeyArabic) == true ? AppLocale.ar : AppLocale.en;
  return LangPrefs(state);
});

class LangPrefs extends StateNotifier<AppLocale> {
  final prefs = SharedPrefs.instance;

  LangPrefs(super.state);

  Future<void> setLangToArabic() async {
    LocaleSettings.setLocale(AppLocale.ar);
    await prefs.setBool(isKeyArabic, true);
    state = AppLocale.ar;
  }

  Future<void> setLangToEnglish() async {
    LocaleSettings.setLocale(AppLocale.en);
    await prefs.setBool(isKeyArabic, false);

    state = AppLocale.en;
  }

  Future<void> setLang(AppLocale lang) async {
    LocaleSettings.setLocale(
        AppLocale.en == lang ? AppLocale.en : AppLocale.ar);
    await prefs.setBool(isKeyArabic, lang == AppLocale.ar);
    state = lang;
  }

  Locale get locale => isArabic ? const Locale('ar') : const Locale('en');
}
