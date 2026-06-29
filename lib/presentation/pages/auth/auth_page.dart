import 'package:auto_route/annotations.dart';
import 'package:ddd_clean_template/common/theme/core/functions.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final styles = context.textStyles;

    return Scaffold(
      appBar: AppBar(title: Text('$this')),
      body: SingleChildScrollView(
        padding: const .all(AppDimens.spaceSm),
        child: Column(
          children: [
            Container(
              width: .infinity,
              height: AppDimens.iconLg,
              color: colors.primary,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(AppDimens.radiusLg),
                  side: BorderSide(
                    color: colors.border,
                    width: AppDimens.borderThin,
                  ),
                ),
              ),
              child: Text('Demo', style: styles.pageTitle),
            ),
          ],
        ),
      ),
    );
  }
}
