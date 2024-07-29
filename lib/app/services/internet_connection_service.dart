import 'dart:async';
import 'dart:developer';

import 'package:salefny/app/core/enums/internet_status.dart';
import 'package:event_bus/event_bus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionService {
  static final _connection = InternetConnection.createInstance(
    checkInterval: const Duration(seconds: 3),
  );
  static final event = EventBus();

  InternetConnectionService._();

  static void init() {
    ConnectionStatus prevStatus = ConnectionStatus.connected;
    _connection.onStatusChange.listen((state) async {
      final newStatus = state.toConnectionStatus;
      if (newStatus == prevStatus) return;
      switch (newStatus) {
        case ConnectionStatus.connected:
          if (prevStatus == ConnectionStatus.weak) break;
          prevStatus = ConnectionStatus.connected;
          event.fire(ConnectionStatus.connected);
          break;
        case ConnectionStatus.disconnected:
          if (await isReallyDisconnected) {
            prevStatus = ConnectionStatus.disconnected;
            event.fire(ConnectionStatus.disconnected);
          } else {
            prevStatus = ConnectionStatus.weak;
            event.fire(ConnectionStatus.weak);
          }
          break;
        case ConnectionStatus.weak:
          break;
      }
    });
  }

  static Future<bool> get isReallyDisconnected async {
    for (int i = 0; i < 2; i++) {
      log(
        ' isReallyDisconnected num ${i + 1}  ${DateTime.now()}',
        name: 'ConnectionStatus',
      );
      await Future.delayed(const Duration(seconds: 1));
      if (await _connection.hasInternetAccess) return false;
    }
    return true;
  }
}

extension NewState on InternetStatus {
  ConnectionStatus get toConnectionStatus => this == InternetStatus.connected
      ? ConnectionStatus.connected
      : ConnectionStatus.disconnected;
}
