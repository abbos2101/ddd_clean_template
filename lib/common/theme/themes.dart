import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme(Brightness brightness) {
    final colorScheme = AppColors.withBrightness(brightness);

    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,

      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colorScheme.primary,
        secondary: colorScheme.secondary,
        error: colorScheme.error,
        surface: colorScheme.surface,
        onPrimary: colorScheme.onPrimary,
        onSecondary: colorScheme.onSecondary,
        onError: colorScheme.onError,
        onSurface: colorScheme.onSurface,
        outline: colorScheme.border,
        shadow: colorScheme.shadow,
        onSurfaceVariant: colorScheme.hint,
        outlineVariant: colorScheme.divider,
      ),
      scaffoldBackgroundColor: colorScheme.scaffoldBackground,
      shadowColor: colorScheme.shadow,
      hintColor: colorScheme.hint,
      dividerColor: colorScheme.divider,
      disabledColor: colorScheme.disabled,

      appBarTheme: _appBarTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          overlayColor: Platform.isAndroid ? null : Colors.transparent,
          elevation: 2,
        ),
      ),
    );
  }

  static AppBarTheme _appBarTheme(AppColorScheme colorScheme) =>
      const AppBarTheme(surfaceTintColor: Colors.transparent);
}

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppColorScheme get appColors => AppColors.of(this);

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
