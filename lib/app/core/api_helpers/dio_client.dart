import 'dart:developer';
import 'dart:io';

import 'package:salefny/app/core/api_helpers/exceptions.dart';
import 'package:salefny/app/core/data/locale/agent_pref.dart';
import 'package:salefny/app/core/data/locale/lang_pref.dart';
import 'package:salefny/app/core/data/locale/user_pref.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// wrapper around dio to handlers api calls
class DioClient {
  final Dio dio;
  final LangPrefs langPrefs;
  final UserAgentPrefs userAgent;

  DioClient({
    required this.dio,
    required this.userAgent,
    required this.langPrefs,
  });

  Future<String> get userToken async => UserPrefs.getUserToken();

  /// sends a [GET] request to the given [url]

  Future<Response> get(
    String path, {
    Json headers = const {},
    Json query = const {},
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio.get(
          UserPrefs.getServerUrl() + path,
          queryParameters: {
            ...query,
          },
          options: Options(
            headers: {
              'User-Agent': userAgent.getUserAgent,
              if (attachToken) 'Authorization': token ?? await userToken,
              ...headers,
              'Accept-Language': langPrefs.locale.toString(),
            },
          ),
        ),
      );

  Future<Response> post(
    String path, {
    Object body = const {},
    Json headers = const {},
    Json query = const {},
    String? contentType,
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio.post(
          UserPrefs.getServerUrl() + path,
          queryParameters: {
            ...query,
          },
          data: body,
          options: Options(
            headers: {
              'User-Agent': userAgent.getUserAgent,
              'Accept-Language': langPrefs.locale.toString(),
              if (attachToken) 'Authorization': token ?? await userToken,
              ...headers,
            },
          ),
        ),
      );

  Future<Response> delete(
    String path, {
    Object body = const {},
    Json headers = const {},
    Json query = const {},
    String? contentType,
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio.delete(
          UserPrefs.getServerUrl() + path,
          queryParameters: {
            ...query,
          },
          data: body,
          options: Options(
            headers: {
              'User-Agent': userAgent.getUserAgent,
              'Accept-Language': langPrefs.locale.toString(),
              if (attachToken) 'Authorization': token ?? await userToken,
              ...headers,
            },
          ),
        ),
      );

  Future<Response> put(
    String path, {
    Object body = const {},
    Json headers = const {},
    Json query = const {},
    String? contentType,
    bool attachToken = true,
    String? token,
  }) =>
      validateResponse(
        () async => dio.put(
          UserPrefs.getServerUrl() + path,
          queryParameters: {
            ...query,
          },
          data: body,
          options: Options(
            headers: {
              'User-Agent': userAgent.getUserAgent,
              'Accept-Language': langPrefs.locale.toString(),
              if (attachToken) 'Authorization': token ?? await userToken,
              ...headers,
            },
          ),
        ),
      );
}

Future<Response> validateResponse(
  Future<Response> Function() zone,
) async {
  try {
    final res = await zone();

    if (res.statusCode == 200 &&
        res.data != null &&
        res.data is String &&
        (res.data! as String).isEmpty) {
      throw EmptyBadResponse();
    }
    switch (res.statusCode) {
      case HttpStatus.internalServerError:
        throw InternalServerError();
      case HttpStatus.unauthorized:
        throw UnAuthorized(res);
      default:
        return res;
    }
  } on DioException catch (e, st) {
    log(e.toString());
    log(st.toString());
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.unknown) {
      final hasConnection = await InternetConnection().hasInternetAccess;
      if (!hasConnection) {
        throw NoInternetConnection();
      }
      throw InternalServerError();
    }
    rethrow;
  }
}

Object? extractError(dynamic data) => data is Map ? data['msg'] : null;
