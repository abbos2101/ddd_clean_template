import 'package:alice/alice.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:ddd_clean_template/common/constants/app_env.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/connection_checker_interceptor.dart';
import 'interceptors/my_log_interceptor.dart';
import 'interceptors/token_interceptor.dart';

@Singleton()
class HttpService {
  final Alice _alice;
  final AliceDioAdapter _aliceAdapter;
  final MyLogInterceptor _logInterceptor;
  final ConnectionCheckerInterceptor _connectionCheckerInterceptor;
  final TokenInterceptor _tokenInterceptor;
  final CacheOptions _cacheOptions;

  const HttpService(
    this._alice,
    this._aliceAdapter,
    this._logInterceptor,
    this._connectionCheckerInterceptor,
    this._tokenInterceptor,
    this._cacheOptions,
  );

  @PostConstruct()
  void init() => _alice.addAdapter(_aliceAdapter);

  Dio client({
    required bool requiredToken,
    Duration? cacheDuration,
    String? baseUrl,
    Duration? receiveTimeout = const Duration(seconds: 60),
    Duration? sendTimeout = const Duration(seconds: 60),
    Duration? connectTimeout = const Duration(seconds: 60),
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? AppEnv.baseUrl,
        receiveTimeout: receiveTimeout,
        connectTimeout: connectTimeout,
        sendTimeout: sendTimeout,
      ),
    );

    final interceptors = [
      if (AppEnv.devMode) _aliceAdapter,
      if (AppEnv.devMode) _logInterceptor,

      if (requiredToken) _tokenInterceptor,

      if (cacheDuration == null || cacheDuration.inSeconds == 0)
        _connectionCheckerInterceptor,

      if (cacheDuration != null)
        DioCacheInterceptor(
          options: _cacheOptions.copyWith(
            policy: cacheDuration.inSeconds == 0
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache,
            maxStale: cacheDuration,
          ),
        ),
    ];

    dio.interceptors.addAll(interceptors);
    return dio;
  }

  Future<void> clearCache() async => await _cacheOptions.store?.clean();
}
