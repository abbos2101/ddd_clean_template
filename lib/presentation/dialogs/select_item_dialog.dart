import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:ddd_clean_template/common/theme/colors.dart';
import 'package:ddd_clean_template/common/theme/themes.dart';
import 'package:ddd_clean_template/common/widgets/app_shimmer.dart';
import 'package:ddd_clean_template/common/words/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SelectItemMode { draggable, fixed, wrap }

class SelectItemDialog<T> extends StatefulWidget {
  final T? selected;
  final SelectItemMode mode;
  final double heightFactor;
  final String Function(T e) labelFrom;
  final FutureOr<List<T>> Function() fetchItems;
  final Widget Function(int index)? separatorBuilder;
  final Widget Function(T e, bool isSelected)? itemBuilder;

  const SelectItemDialog({
    super.key,
    this.selected,
    this.mode = SelectItemMode.draggable,
    this.heightFactor = 0.5,
    required this.labelFrom,
    required this.fetchItems,
    this.separatorBuilder,
    this.itemBuilder,
  });

  Future<T?> show(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      isDismissible: true,
      builder: (context) => this,
    );
  }

  @override
  State<SelectItemDialog<T>> createState() => _SelectItemDialogState<T>();
}

class _SelectItemDialogState<T> extends State<SelectItemDialog<T>> {
  late Future<List<T>> future = Future.value(widget.fetchItems());

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    switch (widget.mode) {
      case SelectItemMode.draggable:
        return DraggableScrollableSheet(
          snap: false,
          snapSizes: [widget.heightFactor, 1.0],
          maxChildSize: 1,
          minChildSize: 0,
          initialChildSize: widget.heightFactor,
          shouldCloseOnMinExtent: true,
          builder: (_, scrollController) {
            return _buildSheet(colors, scrollController);
          },
        );
      case SelectItemMode.fixed:
        return FractionallySizedBox(
          heightFactor: widget.heightFactor,
          child: _buildSheet(colors, null),
        );
      case SelectItemMode.wrap:
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * widget.heightFactor,
          ),
          child: _buildSheet(colors, null, shrinkWrap: true),
        );
    }
  }

  Widget _buildSheet(
    AppColorScheme colors,
    ScrollController? scrollController, {
    bool shrinkWrap = false,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const .vertical(top: .circular(20)),
      ),
      child: Column(
        spacing: 12,
        mainAxisSize: shrinkWrap ? .min : .max,
        crossAxisAlignment: .start,
        children: [
          Center(
            child: Container(
              height: 5,
              width: kToolbarHeight,
              margin: const .only(top: 10),
              decoration: ShapeDecoration(
                color: colors.border,
                shape: RoundedRectangleBorder(borderRadius: .circular(8)),
              ),
            ),
          ),

          shrinkWrap
              ? Flexible(child: _buildList(colors, scrollController, true))
              : Expanded(child: _buildList(colors, scrollController, false)),
        ],
      ),
    );
  }

  Widget _buildList(
    AppColorScheme colors,
    ScrollController? scrollController,
    bool shrinkWrap,
  ) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _ShimmerList(separatorBuilder: widget.separatorBuilder);
        }

        if (snapshot.hasError) {
          return _ErrorView(
            error: '${snapshot.error}',
            onPressed: () {
              future = Future.value(widget.fetchItems());
              setState(() {});
            },
          );
        }

        final items = snapshot.data ?? [];
        return ListView.separated(
          shrinkWrap: shrinkWrap,
          physics: shrinkWrap
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          itemCount: items.length,
          controller: scrollController,
          padding: const .only(left: 16, right: 16, bottom: 32),
          separatorBuilder: (_, i) {
            return widget.separatorBuilder?.call(i) ?? const Divider();
          },
          itemBuilder: (_, i) {
            final item = items[i];
            final isSelected = item == widget.selected;
            return CupertinoButton(
              padding: .zero,
              sizeStyle: .small,
              onPressed: () => context.pop(item),
              child:
                  widget.itemBuilder?.call(item, isSelected) ??
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.labelFrom(item),
                          style: TextStyle(
                            color: isSelected
                                ? colors.primary
                                : colors.onSurface,
                          ),
                        ),
                      ),
                      if (isSelected) Icon(Icons.check, color: colors.primary),
                    ],
                  ),
            );
          },
        );
      },
    );
  }
}

class _ShimmerList extends StatelessWidget {
  final Widget Function(int index)? separatorBuilder;

  const _ShimmerList({this.separatorBuilder});

  @override
  Widget build(BuildContext context) => ListView.separated(
    itemCount: 8,
    shrinkWrap: true,
    padding: const .symmetric(horizontal: 16),
    physics: const NeverScrollableScrollPhysics(),
    separatorBuilder: (_, i) {
      return separatorBuilder?.call(i) ?? const Divider();
    },
    itemBuilder: (_, _) {
      return const AppShimmer(
        enabled: true,
        child: Text(
          '12319236121212312',
          style: TextStyle(
            fontSize: 16,
            fontWeight: .w500,
            color: Colors.black,
          ),
        ),
      );
    },
  );
}

class _ErrorView extends StatelessWidget {
  final String error;
  final Function() onPressed;

  const _ErrorView({required this.error, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return SizedBox(
      height: 200,
      width: .infinity,
      child: Column(
        spacing: 10,
        mainAxisSize: .max,
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Icon(CupertinoIcons.xmark_circle_fill, color: colors.error, size: 40),
          Padding(
            padding: const .symmetric(horizontal: 20),
            child: Text(
              error,
              textAlign: .center,
              maxLines: 4,
              overflow: .ellipsis,
            ),
          ),

          CupertinoButton(
            onPressed: onPressed,
            padding: const .symmetric(vertical: 10, horizontal: 20),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: .circular(12),
                border: Border.all(color: colors.border),
              ),
              child: Text(
                Words.retry.str,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w500,
                  color: colors.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
