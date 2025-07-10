import 'package:flutter/material.dart';

extension MyContext on BuildContext {
  Size get sizeOf => MediaQuery.of(this).size;

  bool get isMobile => MediaQuery.of(this).size.shortestSide < 600;

  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600;

  bool get isDesktop => MediaQuery.of(this).size.shortestSide >= 1024;
}
