// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:ddd_clean_template/presentation/pages/auth/auth_page.dart'
    as _i1;
import 'package:ddd_clean_template/presentation/pages/one_id/one_id_page.dart'
    as _i2;
import 'package:ddd_clean_template/presentation/pages/splash/splash_page.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute({List<_i4.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.OneIdPage]
class OneIdRoute extends _i4.PageRouteInfo<OneIdRouteArgs> {
  OneIdRoute({
    _i5.Key? key,
    required String oneIdUrl,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         OneIdRoute.name,
         args: OneIdRouteArgs(key: key, oneIdUrl: oneIdUrl),
         initialChildren: children,
       );

  static const String name = 'OneIdRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OneIdRouteArgs>();
      return _i2.OneIdPage(key: args.key, oneIdUrl: args.oneIdUrl);
    },
  );
}

class OneIdRouteArgs {
  const OneIdRouteArgs({this.key, required this.oneIdUrl});

  final _i5.Key? key;

  final String oneIdUrl;

  @override
  String toString() {
    return 'OneIdRouteArgs{key: $key, oneIdUrl: $oneIdUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OneIdRouteArgs) return false;
    return key == other.key && oneIdUrl == other.oneIdUrl;
  }

  @override
  int get hashCode => key.hashCode ^ oneIdUrl.hashCode;
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashPage();
    },
  );
}
