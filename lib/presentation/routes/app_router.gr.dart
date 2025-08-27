// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:ddd_clean_template/presentation/pages/auth/auth_page.dart'
    as _i1;
import 'package:ddd_clean_template/presentation/pages/demo/demo_page.dart'
    as _i2;
import 'package:ddd_clean_template/presentation/pages/posts/posts_page.dart'
    as _i3;
import 'package:ddd_clean_template/presentation/pages/splash/splash_page.dart'
    as _i4;
import 'package:ddd_clean_template/presentation/pages/users/users_page.dart'
    as _i5;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.DemoPage]
class DemoRoute extends _i6.PageRouteInfo<void> {
  const DemoRoute({List<_i6.PageRouteInfo>? children})
    : super(DemoRoute.name, initialChildren: children);

  static const String name = 'DemoRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.DemoPage();
    },
  );
}

/// generated route for
/// [_i3.PostsPage]
class PostsRoute extends _i6.PageRouteInfo<void> {
  const PostsRoute({List<_i6.PageRouteInfo>? children})
    : super(PostsRoute.name, initialChildren: children);

  static const String name = 'PostsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.PostsPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}

/// generated route for
/// [_i5.UsersPage]
class UsersRoute extends _i6.PageRouteInfo<void> {
  const UsersRoute({List<_i6.PageRouteInfo>? children})
    : super(UsersRoute.name, initialChildren: children);

  static const String name = 'UsersRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.UsersPage();
    },
  );
}
