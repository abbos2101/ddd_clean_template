import 'dart:ui';

import 'package:ddd_clean_template/common/words/words.dart';
import 'package:flutter/material.dart';

class AppSoonWidget extends StatelessWidget {
  final bool showBanner;
  final Widget child;
  final String? bannerText;
  final Color? bannerColor;
  final Color textColor;
  final double blurSigma;

  const AppSoonWidget({
    super.key,
    this.showBanner = true,
    required this.child,
    this.bannerText,
    this.bannerColor,
    this.textColor = Colors.white,
    this.blurSigma = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    if (!showBanner) return child;

    return IgnorePointer(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: blurSigma,
                sigmaY: blurSigma,
              ),
              child: child,
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: bannerColor ?? Colors.blue,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Text(
                bannerText ?? Words.soon.str,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
