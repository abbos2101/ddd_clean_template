import 'package:flutter/material.dart';

import 'core/schemas.dart';

class AppTextStyles {
  final AppColorSchema _c;

  const AppTextStyles(this._c);

  TextStyle get pageTitle {
    return TextStyle(fontSize: 20, fontWeight: .w600, color: _c.textPrimary);
  }
}
