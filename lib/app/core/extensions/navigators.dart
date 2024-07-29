import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  StackRouter get navigator => AutoRouter.of(this);

  void pop({Object? result}) => navigator.pop(result);

  Future push(PageRouteInfo route) async => navigator.push(route);

  Future pushAndPopUntil(
    PageRouteInfo route,
    bool Function(Route route) predicate,
  ) async =>
      navigator.pushAndPopUntil(route, predicate: predicate);

  Future pushAndPopAll(PageRouteInfo route) => navigator.pushAndPopAll(route);

  ModalRoute get currentRoute => navigator.currentRoute(this);
}

extension Navigator on StackRouter {
  void pop({Object? result}) => this.pop(result);

  Future push(PageRouteInfo route) async {
    return this.push(route);
  }

  Future pushAndPopUntil(
    PageRouteInfo route,
    bool Function(Route route) predicate,
  ) async {
    return this.pushAndPopUntil(
      route,
      predicate: predicate,
    );
  }

  Future pushAndPopAll(PageRouteInfo route) {
    return pushAndPopUntil(route, (route) => false);
  }

  ModalRoute currentRoute(BuildContext context) => ModalRoute.of(context)!;
}
