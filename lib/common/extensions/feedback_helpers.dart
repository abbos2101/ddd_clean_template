import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ddd_clean_template/common/theme/colors.dart';

import '../words/words.dart';

// ==================== DIALOGS ====================

enum DialogStyle { material, cupertino, adaptive }

Future<bool> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? confirmTitle,
  String? cancelTitle,
  DialogStyle style = DialogStyle.adaptive,
}) => _show(context, title, message, style, true, confirmTitle, cancelTitle);

Future<bool> showRequiredDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? buttonTitle,
  DialogStyle style = DialogStyle.adaptive,
}) => _show(context, title, message, style, false, buttonTitle, null);

Future<bool> _show(
  BuildContext context,
  String title,
  String message,
  DialogStyle style,
  bool isConfirm,
  String? btn1,
  String? btn2,
) async {
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

enum SnackBarType { success, error, warning, info }

void showSnackBar(
  BuildContext context, {
  required String message,
  SnackBarType type = SnackBarType.info,
  Duration duration = const Duration(seconds: 3),
}) {
  final colors = AppColors.of(context);
  Color backgroundColor;
  Color textColor = colors.onSurface;

  switch (type) {
    case SnackBarType.success:
      backgroundColor = colors.success;
      break;
    case SnackBarType.error:
      backgroundColor = colors.error;
      break;
    case SnackBarType.warning:
      backgroundColor = colors.warning;
      break;
    case SnackBarType.info:
      backgroundColor = colors.info;
      break;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
