import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/theme/theme_cubit.dart';
import '../theme/colors.dart';

/// 🌙☀️ BEAUTIFUL THEME SWITCH WIDGET
/// Think of this like a "LIGHT SWITCH" in a restaurant 💡
///
/// 🏪 Simple Switch Metaphor:
/// - This is like a BEAUTIFUL LIGHT SWITCH on the wall
/// - Shows: Sun ☀️ for light mode, Moon 🌙 for dark mode
/// - Smooth: Animated transitions like a real switch
/// - Visual: Clear indication of current theme
///
/// 🎨 Beautiful Features:
/// 1. 🌟 Smooth animations
/// 2. 🎯 Clear visual feedback
/// 3. 💎 Modern design with shadows
/// 4. 🌈 Theme-aware colors
/// 5. 🖱️ Satisfying interaction

class AppThemeSwitch extends StatelessWidget {
  final double? width;
  final double? height;
  final bool showLabel;

  const AppThemeSwitch({
    super.key,
    this.width,
    this.height,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;
        final colorScheme = AppColors.of(context);

        return GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggle(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: width ?? 120,
            height: height ?? 56,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        const Color(0xFF2C3E50), // Dark blue-gray
                        const Color(0xFF34495E), // Lighter dark blue-gray
                      ]
                    : [
                        const Color(0xFFFFD93D), // Sunny yellow
                        const Color(0xFFFF8C42), // Orange
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.3)
                      : Colors.orange.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                // 🌟 Background icons
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.wb_sunny_outlined,
                        color: isDark
                            ? Colors.white.withOpacity(0.3)
                            : Colors.white.withOpacity(0.8),
                        size: 20,
                      ),
                      Icon(
                        Icons.nightlight_round,
                        color: isDark
                            ? Colors.white.withOpacity(0.8)
                            : Colors.white.withOpacity(0.3),
                        size: 20,
                      ),
                    ],
                  ),
                ),

                // 🎯 Sliding indicator
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: isDark
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      isDark ? Icons.nightlight_round : Icons.wb_sunny,
                      color: isDark
                          ? const Color(0xFF2C3E50)
                          : const Color(0xFFFF8C42),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 🎨 COMPACT THEME SWITCH (for smaller spaces)
class AppThemeSwitchCompact extends StatelessWidget {
  const AppThemeSwitchCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;

        return IconButton(
          onPressed: () => context.read<ThemeCubit>().toggle(),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(isDark),
              color: isDark ? const Color(0xFFFFD93D) : const Color(0xFF2C3E50),
            ),
          ),
          tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        );
      },
    );
  }
}
