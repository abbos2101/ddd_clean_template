import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final Widget Function(List<Locale> supportedLocales) builder;
  final String localesPath;
  final List<Locale> supportedLocales;

  const App({
    super.key,
    required this.builder,
    required this.localesPath,
    required this.supportedLocales,
  });

  @override
  Widget build(BuildContext context) => EasyLocalization(
    saveLocale: true,
    path: localesPath,
    supportedLocales: supportedLocales,
    startLocale: supportedLocales.first,
    fallbackLocale: supportedLocales.first,
    useOnlyLangCode: supportedLocales.first.countryCode == null,
    child: builder(supportedLocales),
  );
}
