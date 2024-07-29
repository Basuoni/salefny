import 'dart:io';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';

final logoutEventBus = EventBus();

class UnitsDioInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data is! Map) {
      handler.next(response);
      return;
    }

    final isDisabledUser = response.statusCode == HttpStatus.unauthorized;
    if (isDisabledUser) {
      logoutEventBus.fire(true);
    }
    handler.next(response);
  }
}
