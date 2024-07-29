import 'package:salefny/app/core/data/locale/pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardingPrefsProvider = Provider<OnBoardingPrefs>((ref) {
  return OnBoardingPrefs();
});

class OnBoardingPrefs {
  final prefs = SharedPrefs.instance;

  Future<void> setOnBoarding(bool seen) => prefs.setBool('onBoarding', seen);

  bool getOnBoarding() => prefs.getBool('onBoarding') ?? false;
}
