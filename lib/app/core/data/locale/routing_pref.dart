import 'package:salefny/app/router/auto_router.gr.dart';

///Todo edit this class to return the initial route

class RoutingPrefs {
  RoutingPrefs._();

  static Object get initialRoute => const NotificationRoute();
// globalRefContainer.read(onBoardingPrefsProvider).getOnBoarding()
//     ? globalRefContainer.read(userPrefsProvider).isUserLoggedIn
//         ? BottomNavRoute()
//         : WelcomeRoute()
//     : OnBoardingRoute();
}
