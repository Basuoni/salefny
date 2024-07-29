import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, Object? argument) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: argument);
  }
}
