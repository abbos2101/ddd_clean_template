import 'package:flutter/material.dart';

import 'app_shimmer.dart';

class AppShimmerText extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const AppShimmerText({
    super.key,
    this.width = 56,
    this.height = 20,
    this.radius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(radius),
        ),
      ),
    );
  }
}
