import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ddd_clean_template/infrastructure/services/cache/secure_cache.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';

@Singleton()
class TokenInterceptor extends Interceptor {
  final SecureCache _cache;

  const TokenInterceptor(this._cache);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _cache.token;
    if (token.isNotEmpty) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _handleUnauthorized();
      handler.reject(err);
      return;
    }
    super.onError(err, handler);
  }

  Future<void> _handleUnauthorized() async {
    await _cache.clear();
    // router.pushAndPopUntil(const AuthRoute(), predicate: (_) => false);
  }
}
