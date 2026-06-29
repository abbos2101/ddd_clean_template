import 'package:flutter/material.dart';

import 'core/functions.dart';

abstract final class AppTheme {
  static ThemeData theme(Brightness brightness) {
    final colors = AppColors.withBrightness(brightness);

    return AppColors.theme(brightness).copyWith(
      appBarTheme: _appBarTheme(colors),
      floatingActionButtonTheme: _floatingActionButtonTheme(colors),
      inputDecorationTheme: _inputDecorationTheme(colors),
      textTheme: _textTheme(colors),
    );
  }

  static AppBarTheme _appBarTheme(AppColorSchema colors) {
    return AppBarTheme(
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: colors.surface,
      actionsIconTheme: IconThemeData(color: colors.onSecondary),
      iconTheme: IconThemeData(color: colors.textPrimary),
      titleTextStyle: TextStyle(
        fontSize: 15,
        fontWeight: .w500,
        color: colors.textPrimary,
      ),
      toolbarTextStyle: TextStyle(color: colors.onSecondary, fontWeight: .w500),
    );
  }

  static FloatingActionButtonThemeData _floatingActionButtonTheme(
    AppColorSchema colors,
  ) {
    return FloatingActionButtonThemeData(
      backgroundColor: colors.primary,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(AppColorSchema colors) {
    return InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: colors.surface,
      contentPadding: const .symmetric(vertical: 10, horizontal: 12),
      prefixIconConstraints: const BoxConstraints(maxHeight: 20),
      hintStyle: TextStyle(fontSize: 14, fontWeight: .w400, color: colors.hint),
      border: OutlineInputBorder(
        borderRadius: .circular(12),
        borderSide: BorderSide(color: colors.border, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: .circular(12),
        borderSide: BorderSide(color: colors.border, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(12),
        borderSide: BorderSide(color: colors.border, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(12),
        borderSide: BorderSide(color: colors.primary, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: .circular(12),
        borderSide: BorderSide(color: colors.error, width: 1),
      ),
    );
  }

  static TextTheme _textTheme(AppColorSchema colors) {
    return TextTheme(
      // for TextField
      bodyLarge: TextStyle(color: colors.textPrimary, fontWeight: .w400),
      // for Text
      bodyMedium: TextStyle(color: colors.textPrimary, fontWeight: .w500),
    );
  }
}
