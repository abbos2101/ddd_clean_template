import 'dart:ui';

abstract interface class AppColorSchema {
  // Primary
  Color get primary;

  Color get onPrimary;

  // Secondary
  Color get secondary;

  Color get onSecondary;

  // Surface
  Color get surface;

  Color get onSurface;

  Color get surfaceSelected;

  // UI
  Color get scaffoldBackground;

  Color get border;

  Color get divider;

  Color get hint;

  Color get disabled;

  Color get shadow;

  // Text, Icons and other elements
  Color get textPrimary;

  Color get textSecondary;

  // Semantic
  Color get error;

  Color get onError;

  Color get success;

  Color get onSuccess;
}
