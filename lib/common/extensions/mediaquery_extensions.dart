import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  bool get isMobile => MediaQuery.of(this).size.width < 768;

  bool get isTablet =>
      MediaQuery.of(this).size.width >= 768 &&
      MediaQuery.of(this).size.width < 1024;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double dynamicWidth(double percent) =>
      MediaQuery.of(this).size.width * percent;

  double dynamicHeight(double percent) =>
      MediaQuery.of(this).size.height * percent;
}
