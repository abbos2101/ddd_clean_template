import 'package:ddd_clean_template/common/extensions/string_extensions.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import '../text_styles.dart';
import 'schemas.dart';

export '../colors.dart';
export '../dimens.dart';
export '../text_styles.dart';
export 'schemas.dart';

abstract final class AppColors {
  static final AppColorSchema light = LightColorScheme();
  static final AppColorSchema dark = LightColorScheme();

  static AppColorSchema of(BuildContext context) =>
      Theme.of(context).brightness == .dark ? dark : light;

  static AppColorSchema withBrightness(Brightness brightness) =>
      brightness == .dark ? dark : light;

  static AppColorSchema withoutContext() {
    final context = router.navigatorKey.currentState!.context;
    return Theme.of(context).brightness == .dark ? dark : light;
  }

  static ThemeData theme(Brightness brightness) {
    final colors = withBrightness(brightness);

    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(),
      fontFamily: GoogleFonts.inter().fontFamily?.toTitleCase(),
      hintColor: colors.hint,
      shadowColor: colors.hint,
      dividerColor: colors.divider,
      scaffoldBackgroundColor: colors.scaffoldBackground,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        secondary: colors.secondary,
        error: colors.error,
        surface: colors.surface,
        onPrimary: colors.onPrimary,
        onSecondary: colors.onSecondary,
        onError: colors.onError,
        onSurface: colors.onSurface,
        outline: colors.border,
        onSurfaceVariant: colors.hint,
        outlineVariant: colors.divider,
      ),
    );
  }
}

extension AppThemeExtension on BuildContext {
  AppColorSchema get appColors => AppColors.of(this);

  AppTextStyles get textStyles => AppTextStyles(AppColors.of(this));

  bool get isDark => Theme.of(this).brightness == .dark;
}
