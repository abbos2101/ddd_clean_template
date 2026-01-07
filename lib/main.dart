import 'dart:async';

import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'application/device_info/device_info_cubit.dart';
import 'application/locale/locale_cubit.dart';
import 'application/network_info/network_info_cubit.dart';
import 'application/theme/theme_cubit.dart';
import 'common/theme/themes.dart';
import 'common/widgets/app.dart';
import 'common/widgets/app_error_widget.dart';
import 'di.dart';

void main() {
  runZonedGuarded(
    () async {
      await setupConfigs();
      await setupDI();
      ErrorWidget.builder = (details) => AppErrorWidget(details: details);

      runApp(
        App(
          localesPath: 'assets/tr',
          supportedLocales: const [Locale('uz', 'UZ')],
          builder: (locales) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => di<LocaleCubit>()..init(locales)),
              BlocProvider(create: (_) => di<ThemeCubit>()..init()),
              BlocProvider(create: (_) => di<DeviceInfoCubit>()..projectInfo()),
              BlocProvider(
                lazy: false,
                create: (_) => di<NetworkInfoCubit>()..init(),
              ),
            ],
            child: const MyApp(),
          ),
        ),
      );
    },
    (error, stack) {
      if (kDebugMode) {
        print(error);
        print(stack);
      }
      // if you need crashlytics
      // FirebaseCrashlytics.instance.recordError(error, stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: context.read<DeviceInfoCubit>().state.projectInfo.appName,
    debugShowCheckedModeBanner: false,
    routerConfig: router.config(),
    builder: (context, child) => GestureDetector(
      // hide keyboard
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: EasyLoading.init()(context, child),
    ),
    theme: AppTheme.theme(Brightness.light),
    darkTheme: AppTheme.theme(Brightness.dark),
    themeMode: context.watch<ThemeCubit>().state.themeMode,
    supportedLocales: context.supportedLocales,
    localizationsDelegates: context.localizationDelegates,
    locale: context.watch<LocaleCubit>().state.locale,
  );
}
