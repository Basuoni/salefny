import 'dart:io';

import 'package:salefny/app/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ResponseClient<T> {
  late T? data;
  late String message;
  late int status;
  late bool isError;

  ResponseClient(Response<dynamic> response) {
    final map = response.data as Json;
    if (response.statusCode != HttpStatus.ok || map['error'] as bool) {
      isError = true;
      message = (map['msg'] ?? 'tr.error_occurred') as String;
    }
    data = map['data'] as T;
    message = map['msg'] as String;
    status =
        map['status'] != null ? (map['status'] as int) : response.statusCode!;
    isError = map['error'] as bool;
  }

  @override
  String toString() {
    return 'ResponseClient{data: $data, message: $message, status: $status, isError: $isError}';
  }
}
