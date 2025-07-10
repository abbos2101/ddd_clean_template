import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ddd_clean_template/infrastructure/services/cache/secure_cache.dart';

import 'common/constants/app_env.dart';
import 'di.config.dart';

final di = GetIt.instance;

Future<void> setupConfigs() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppEnv.init();

  if (AppEnv.onlyPortrait) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false;
}

@InjectableInit(initializerName: 'init')
Future<void> setupDI() async {
  await di.init();
  if (kDebugMode || AppEnv.debugMode) {
    print('TOKEN: ${await di<SecureCache>().token}');
  }
}
