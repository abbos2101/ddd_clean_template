import 'package:flutter/material.dart';

mixin AppColorScheme {
  // Standard Material colors
  Color get primary;

  Color get secondary;

  Color get error;

  Color get surface;

  Color get onPrimary;

  Color get onSecondary;

  Color get onError;

  Color get onSurface;

  // Custom semantic colors
  Color get success;

  Color get warning;

  Color get info;

  // UI element colors
  Color get border;

  Color get divider;

  Color get shadow;

  Color get hint;

  Color get disabled;
}

class LightColorScheme implements AppColorScheme {
  const LightColorScheme._();

  @override
  Color get primary => const Color(0xFF0088CC);

  @override
  Color get secondary => const Color(0xFF40A7E3);

  @override
  Color get error => const Color(0xFFE53935);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get onError => Colors.white;

  @override
  Color get onSurface => const Color(0xFF000000);

  @override
  Color get success => const Color(0xFF4CAF50);

  @override
  Color get warning => const Color(0xFFFF9800);

  @override
  Color get info => const Color(0xFF0088CC);

  @override
  Color get border => const Color(0xFFE0E0E0);

  @override
  Color get divider => const Color(0xFFE0E0E0);

  @override
  Color get shadow => const Color(0x1A000000);

  @override
  Color get hint => const Color(0xFF757575);

  @override
  Color get disabled => const Color(0xFFBDBDBD);
}

class DarkColorScheme implements AppColorScheme {
  const DarkColorScheme._();

  @override
  Color get primary => const Color(0xFF5DADE2);

  @override
  Color get secondary => const Color(0xFF85C1E9);

  @override
  Color get error => const Color(0xFFEF5350);

  @override
  Color get surface => const Color(0xFF2D2D2D);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get onError => Colors.white;

  @override
  Color get onSurface => const Color(0xFFFFFFFF);

  @override
  Color get success => const Color(0xFF66BB6A);

  @override
  Color get warning => const Color(0xFFFFB74D);

  @override
  Color get info => const Color(0xFF5DADE2);

  @override
  Color get border => const Color(0xFF404040);

  @override
  Color get divider => const Color(0xFF404040);

  @override
  Color get shadow => const Color(0x33000000);

  @override
  Color get hint => const Color(0xFF9E9E9E);

  @override
  Color get disabled => const Color(0xFF616161);
}

// Global access
class AppColors {
  const AppColors._();

  static const AppColorScheme light = LightColorScheme._();
  static const AppColorScheme dark = DarkColorScheme._();

  static AppColorScheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }

  static AppColorScheme withBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }
}

// AppColors.of(context).success
// AppColors.light.border
// AppColors.withBrightness(Brightness.light).error
