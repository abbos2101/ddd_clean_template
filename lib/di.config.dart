// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ddd_clean_template/application/crypto/crypto_cubit.dart'
    as _i873;
import 'package:ddd_clean_template/application/device_info/device_info_cubit.dart'
    as _i883;
import 'package:ddd_clean_template/application/locale/locale_cubit.dart'
    as _i512;
import 'package:ddd_clean_template/application/network_info/network_info_cubit.dart'
    as _i53;
import 'package:ddd_clean_template/application/posts/posts_cubit.dart' as _i44;
import 'package:ddd_clean_template/application/theme/theme_cubit.dart' as _i330;
import 'package:ddd_clean_template/application/users/users_cubit.dart' as _i244;
import 'package:ddd_clean_template/domain/facades/crypto_facade.dart' as _i303;
import 'package:ddd_clean_template/domain/facades/fake_facade.dart' as _i895;
import 'package:ddd_clean_template/domain/facades/users_facade.dart' as _i109;
import 'package:ddd_clean_template/domain/repositories/posts_repository.dart'
    as _i281;
import 'package:ddd_clean_template/infrastructure/datasources/crypto_datasource.dart'
    as _i863;
import 'package:ddd_clean_template/infrastructure/datasources/fake_datasource.dart'
    as _i727;
import 'package:ddd_clean_template/infrastructure/datasources/posts_datasource.dart'
    as _i674;
import 'package:ddd_clean_template/infrastructure/datasources/users_datasource.dart'
    as _i581;
import 'package:ddd_clean_template/infrastructure/facades/crypto_facade_impl.dart'
    as _i930;
import 'package:ddd_clean_template/infrastructure/facades/users_facade_impl.dart'
    as _i449;
import 'package:ddd_clean_template/infrastructure/repositories/posts_repository_impl.dart'
    as _i1024;
import 'package:ddd_clean_template/infrastructure/services/cache/app_cache.dart'
    as _i460;
import 'package:ddd_clean_template/infrastructure/services/cache/cache_service.dart'
    as _i138;
import 'package:ddd_clean_template/infrastructure/services/cache/secure_cache.dart'
    as _i559;
import 'package:ddd_clean_template/infrastructure/services/db/db_crud.dart'
    as _i64;
import 'package:ddd_clean_template/infrastructure/services/db/db_service.dart'
    as _i1004;
import 'package:ddd_clean_template/infrastructure/services/di_module.dart'
    as _i966;
import 'package:ddd_clean_template/infrastructure/services/http/http_service.dart'
    as _i36;
import 'package:ddd_clean_template/infrastructure/services/http/interceptors/connection_checker_interceptor.dart'
    as _i404;
import 'package:ddd_clean_template/infrastructure/services/http/interceptors/my_log_interceptor.dart'
    as _i611;
import 'package:ddd_clean_template/infrastructure/services/http/interceptors/token_interceptor.dart'
    as _i402;
import 'package:ddd_clean_template/presentation/pages/demo/cubit/demo_cubit.dart'
    as _i467;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i695;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dIModule = _$DIModule();
    gh.factory<_i883.DeviceInfoCubit>(() => _i883.DeviceInfoCubit());
    gh.factory<_i53.NetworkInfoCubit>(() => _i53.NetworkInfoCubit());
    gh.factory<_i64.DBCrud<dynamic>>(() => _i64.DBCrud<dynamic>());
    await gh.singletonAsync<_i138.CacheService>(() {
      final i = _i138.CacheService();
      return i.init().then((_) => i);
    }, preResolve: true);
    gh.singleton<_i611.MyLogInterceptor>(() => const _i611.MyLogInterceptor());
    gh.singleton<_i558.FlutterSecureStorage>(() => dIModule.secureStorage);
    gh.singleton<_i161.InternetConnection>(() => dIModule.connectionChecker);
    await gh.singletonAsync<_i695.CacheOptions>(
      () => dIModule.cacheOptions,
      preResolve: true,
    );
    gh.singleton<_i1004.DBService>(() => _i1004.DBService());
    gh.singleton<_i404.ConnectionCheckerInterceptor>(
      () => _i404.ConnectionCheckerInterceptor(gh<_i161.InternetConnection>()),
    );
    gh.singleton<_i559.SecureCache>(
      () => _i559.SecureCache(
        gh<_i138.CacheService>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i460.AppCache>(() => _i460.AppCache(gh<_i138.CacheService>()));
    gh.singleton<_i402.TokenInterceptor>(
      () => _i402.TokenInterceptor(gh<_i559.SecureCache>()),
    );
    gh.factory<_i512.LocaleCubit>(
      () => _i512.LocaleCubit(gh<_i460.AppCache>()),
    );
    gh.factory<_i330.ThemeCubit>(() => _i330.ThemeCubit(gh<_i460.AppCache>()));
    gh.singleton<_i36.HttpService>(
      () => _i36.HttpService(
        gh<_i611.MyLogInterceptor>(),
        gh<_i404.ConnectionCheckerInterceptor>(),
        gh<_i402.TokenInterceptor>(),
        gh<_i695.CacheOptions>(),
      ),
    );
    gh.factory<_i674.PostsDataSource>(
      () => _i674.PostsDataSource(gh<_i36.HttpService>()),
    );
    gh.factory<_i581.UsersDataSource>(
      () => _i581.UsersDataSource(gh<_i36.HttpService>()),
    );
    gh.factory<_i863.CryptoDataSource>(
      () => _i863.CryptoDataSource(gh<_i36.HttpService>()),
    );
    gh.factory<_i895.FakeFacade>(
      () => _i727.FakeDatasource(gh<_i36.HttpService>()),
    );
    gh.factory<_i109.UsersFacade>(
      () => _i449.UsersFacadeImpl(gh<_i581.UsersDataSource>()),
    );
    gh.factory<_i303.CryptoFacade>(
      () => _i930.CryptoFacadeImpl(gh<_i863.CryptoDataSource>()),
    );
    gh.factory<_i281.PostsRepository>(
      () => _i1024.PostsRepositoryImpl(gh<_i674.PostsDataSource>()),
    );
    gh.factory<_i244.UsersCubit>(
      () => _i244.UsersCubit(gh<_i109.UsersFacade>()),
    );
    gh.factory<_i467.DemoCubit>(() => _i467.DemoCubit(gh<_i895.FakeFacade>()));
    gh.factory<_i44.PostsCubit>(
      () => _i44.PostsCubit(gh<_i281.PostsRepository>()),
    );
    gh.factory<_i873.CryptoCubit>(
      () => _i873.CryptoCubit(gh<_i303.CryptoFacade>()),
    );
    return this;
  }
}

class _$DIModule extends _i966.DIModule {}
