import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class MyLogInterceptor extends Interceptor {
  const MyLogInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      var log =
          'Request | ${options.method}'
          ' | ${options.path}';
      if (options.queryParameters.isNotEmpty) {
        log += ' | ${options.queryParameters}';
      }
      print(log);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      var log =
          "${response.extra['@fromNetwork@'] != false ? response.statusCode : 304}"
          ' | ${response.requestOptions.method}'
          ' | ${response.requestOptions.path}';
      if (response.requestOptions.queryParameters.isNotEmpty) {
        log += ' | ${response.requestOptions.queryParameters}';
      }
      print(log);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '${err.response?.requestOptions.method} '
        '${err.response?.statusCode} '
        '${err.response?.requestOptions.path} '
        '${err.response?.statusMessage}',
      );
    }
    super.onError(err, handler);
  }
}
