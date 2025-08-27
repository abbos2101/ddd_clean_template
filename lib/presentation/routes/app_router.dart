import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

export 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: DemoRoute.page),
    AutoRoute(page: PostsRoute.page),
    AutoRoute(page: UsersRoute.page), // 🏪 Users Store now accessible!
    AutoRoute(page: CryptoRoute.page), // 🪙 Crypto Exchange now accessible!
  ];
}

final router = AppRouter();
