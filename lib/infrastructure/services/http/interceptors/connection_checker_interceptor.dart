import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

@Singleton()
class ConnectionCheckerInterceptor extends Interceptor {
  final InternetConnection _connectionChecker;

  const ConnectionCheckerInterceptor(this._connectionChecker);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (await _connectionChecker.hasInternetAccess) {
      handler.next(options);
    } else {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          response: Response(requestOptions: options, statusCode: 0),
        ),
      );
    }
  }
}
