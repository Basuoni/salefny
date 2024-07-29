import 'package:salefny/app/core/utils/constants.dart';
import 'package:dio/dio.dart';

abstract class ApiException implements Exception {}

class ApiExceptionMessage implements ApiException {
  final dynamic body;

  ApiExceptionMessage([this.body]);

  @override
  String toString() {
    if (body == null) return 'tr.error_occurred';
    if (body is Json) {
      final data = body as Json;
      return data['msg'] as String;
    }
    return body.toString();
  }
}

class EmptyBadResponse implements ApiException {
  @override
  String toString() => 'tr.something_error_try_again';
}

class NoInternetConnection implements ApiException {
  @override
  String toString() {
    return 'tr.no_internet';
  }
}

class InternalServerError implements ApiException {
  @override
  String toString() => 'tr.something_error_try_again';
}

class BadRequest implements InternalServerError {
  final Response<Json> res;

  BadRequest(this.res);
}

class UnAuthorized implements ApiException {
  final Response res;

  UnAuthorized(this.res);

  @override
  String toString() {
    return (res.data as Json)['Message'].toString();
  }
}
