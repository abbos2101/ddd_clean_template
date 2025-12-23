import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:ddd_clean_template/common/constants/app_env.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class DIModule {
  @Singleton()
  FlutterSecureStorage get secureStorage =>
      const FlutterSecureStorage(aOptions: AndroidOptions());

  @Singleton()
  InternetConnection get connectionChecker => InternetConnection();

  @Singleton()
  @preResolve
  Future<CacheOptions> get cacheOptions async {
    final path = kIsWeb ? '/' : (await getTemporaryDirectory()).path;

    return CacheOptions(
      store: HiveCacheStore(path),
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      maxStale: const Duration(hours: 1),
      hitCacheOnErrorCodes: [401, 403, 404, 429],
      allowPostMethod: false,
    );
  }

  @Singleton()
  AliceDioAdapter get aliceDioAdapter => AliceDioAdapter();

  @Singleton()
  Alice get alice => Alice(
    configuration: AliceConfiguration(
      navigatorKey: router.navigatorKey,
      showNotification: AppEnv.devMode,
      showInspectorOnShake: AppEnv.devMode,
      showShareButton: AppEnv.devMode,
    ),
  );
}
