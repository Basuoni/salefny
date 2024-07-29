// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:salefny/app/features/auth/presentation/screens/login_screen.dart'
    as _i2;
import 'package:salefny/app/features/auth/presentation/screens/scan_qr_screen.dart'
    as _i4;
import 'package:salefny/app/features/home/presentation/screens/home_screen.dart'
    as _i1;
import 'package:salefny/app/features/intro/presentation/screens/splash_screen.dart'
    as _i5;
import 'package:salefny/app/features/notification/presentation/screens/notification_screen.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NotificationScreen(),
      );
    },
    ScanQRRoute.name: (routeData) {
      final args = routeData.argsAs<ScanQRRouteArgs>(
          orElse: () => const ScanQRRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ScanQRScreen(
          key: args.key,
          onQRViewCreated: args.onQRViewCreated,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NotificationScreen]
class NotificationRoute extends _i6.PageRouteInfo<void> {
  const NotificationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ScanQRScreen]
class ScanQRRoute extends _i6.PageRouteInfo<ScanQRRouteArgs> {
  ScanQRRoute({
    _i7.Key? key,
    void Function(String)? onQRViewCreated,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ScanQRRoute.name,
          args: ScanQRRouteArgs(
            key: key,
            onQRViewCreated: onQRViewCreated,
          ),
          initialChildren: children,
        );

  static const String name = 'ScanQRRoute';

  static const _i6.PageInfo<ScanQRRouteArgs> page =
      _i6.PageInfo<ScanQRRouteArgs>(name);
}

class ScanQRRouteArgs {
  const ScanQRRouteArgs({
    this.key,
    this.onQRViewCreated,
  });

  final _i7.Key? key;

  final void Function(String)? onQRViewCreated;

  @override
  String toString() {
    return 'ScanQRRouteArgs{key: $key, onQRViewCreated: $onQRViewCreated}';
  }
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
