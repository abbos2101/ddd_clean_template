import 'package:ddd_clean_template/common/words/words.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/core/functions.dart';

enum DialogStyle { material, cupertino, adaptive }

enum SnackBarType { success, error, info }

abstract final class FeedbackHelper {
  // ==================== DIALOGS ====================

  static Future<bool> showConfirmDialog({
    required String title,
    required String message,
    String? confirmTitle,
    String? cancelTitle,
    DialogStyle style = DialogStyle.adaptive,
  }) => _show(title, message, style, true, confirmTitle, cancelTitle);

  static Future<bool> showRequiredDialog({
    required String title,
    required String message,
    String? buttonTitle,
    DialogStyle style = DialogStyle.adaptive,
  }) => _show(title, message, style, false, buttonTitle, null);

  static Future<bool> _show(
    String title,
    String message,
    DialogStyle style,
    bool isConfirm,
    String? btn1,
    String? btn2,
  ) async {
    final context = router.navigatorKey.currentContext!;
    final ios =
        style == DialogStyle.cupertino ||
        (style == DialogStyle.adaptive &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(Theme.of(context).platform));

    final result = await (ios ? showCupertinoDialog : showDialog)<bool?>(
      context: context,
      builder: (ctx) {
        if (ios) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              if (isConfirm)
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text(btn2 ?? Words.no.str),
                ),
              CupertinoDialogAction(
                isDefaultAction: true,
                textStyle: TextStyle(color: AppColors.of(context).secondary),
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(btn1 ?? Words.yes.str),
              ),
            ],
          );
        }
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            if (isConfirm)
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(btn2 ?? Words.no.str),
              ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(btn1 ?? Words.yes.str),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  // ==================== SNACK_BAR ====================

  static void showSnackBar({
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final context = router.navigatorKey.currentContext!;
    final colors = AppColors.of(context);
    Color backgroundColor;
    final Color textColor = colors.onSurface;

    switch (type) {
      case .success:
        backgroundColor = colors.success;
        break;
      case .error:
        backgroundColor = colors.error;
        break;
      case .info:
        backgroundColor = colors.divider;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: .floating,
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      ),
    );
  }
}
