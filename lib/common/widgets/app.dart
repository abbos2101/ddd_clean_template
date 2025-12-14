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
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(), // hide keyboard
    behavior: HitTestBehavior.translucent,
    child: EasyLocalization(
      supportedLocales: supportedLocales,
      path: localesPath,
      fallbackLocale: supportedLocales.first,
      startLocale: supportedLocales.first,
      useOnlyLangCode: supportedLocales.first.countryCode == null,
      saveLocale: true,
      child: builder(supportedLocales),
    ),
  );
}
