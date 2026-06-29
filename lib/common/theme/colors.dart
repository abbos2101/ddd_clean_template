import 'package:flutter/material.dart';

import 'core/schemas.dart';

class LightColorScheme implements AppColorSchema {
  @override
  Color get primary => const Color(0xFF319BF5);

  @override
  Color get secondary => const Color(0xFF20293A);

  @override
  Color get error => const Color(0xFFF44336);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceSelected => const Color(0xFFECF1F3);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onSecondary => const Color(0xFFFFFFFF);

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get onSurface => const Color(0xFF14151A);

  @override
  Color get success => const Color(0xFF26BD6C);

  @override
  Color get scaffoldBackground => const Color(0xFFF6F8F9);

  @override
  Color get border => const Color(0xFFBABABA);

  @override
  Color get divider => const Color(0xFFBABABA);

  @override
  Color get shadow => const Color(0x1A000000);

  @override
  Color get hint => const Color(0x990F1324);

  @override
  Color get disabled => const Color(0xFFBDBDBD);

  @override
  Color get onSuccess => const Color(0xFFFFFFFF);

  @override
  Color get textPrimary => const Color(0xFF14151A);

  @override
  Color get textSecondary => const Color(0x990F1324);
}
