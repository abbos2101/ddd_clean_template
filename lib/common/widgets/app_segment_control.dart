import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSegmentControl extends StatelessWidget {
  final List<String> children;
  final int index;
  final double? width;
  final double fontSize;
  final Function(int index)? onChanged;

  const AppSegmentControl({
    super.key,
    required this.children,
    this.index = 0,
    this.width,
    this.fontSize = 14,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      padding: EdgeInsets.all(fontSize * 0.3),
      decoration: ShapeDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(120),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: CupertinoSlidingSegmentedControl<int>(
        groupValue: index,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        backgroundColor: Colors.transparent,
        children: List<Widget>.generate(
          children.length,
          (i) => Text(children[i], style: TextStyle(fontSize: fontSize)),
        ).asMap(),
        onValueChanged: (value) {
          if (value != null) {
            onChanged?.call(value);
          }
        },
      ),
    );
  }
}
