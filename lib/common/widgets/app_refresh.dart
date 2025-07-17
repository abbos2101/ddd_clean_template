import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppRefresh extends StatelessWidget {
  final RefreshController controller;
  final Widget? child;
  final WaterDropHeader? header;
  final ScrollPhysics? physics;
  final bool enabledRefresh;
  final bool enabledNext;
  final Function()? onNext;
  final Function()? onRefresh;

  const AppRefresh({
    super.key,
    required this.controller,
    this.child,
    this.header,
    this.physics,
    this.enabledRefresh = true,
    this.enabledNext = false,
    this.onRefresh,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SmartRefresher(
      controller: controller,
      physics: physics ?? const ClampingScrollPhysics(),
      header:
          header ??
          WaterDropHeader(
            complete: Icon(Icons.check, color: colorScheme.primary),
            refresh: CupertinoActivityIndicator(
              color: colorScheme.onSurfaceVariant,
            ),
            failed: Icon(Icons.close, color: colorScheme.error),
          ),
      enablePullDown: enabledRefresh,
      enablePullUp: enabledNext,
      onRefresh: onRefresh,
      onLoading: onNext,
      child: child,
    );
  }
}
