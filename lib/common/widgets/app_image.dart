import 'dart:io';
import 'dart:typed_data';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppImage extends StatelessWidget {
  final dynamic image; // this can be string or file
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AppImage(this.image, {super.key, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    if (image is File) {
      return Image.file(image, width: width, height: height, fit: fit);
    }
    if (image is Uint8List) {
      return Image.memory(image, width: width, height: height, fit: fit);
    }

    if (image is String == false) {
      return AppImageError(
        width: width,
        height: height,
        error: 'Invalid image type: ${image.runtimeType}',
      );
    }

    if ((image ?? '').isEmpty) {
      return AppImageError(
        width: width,
        height: height,
        error: 'Image is empty',
      );
    }

    if (image.startsWith('assets/')) {
      return Image.asset(image, width: width, height: height, fit: fit);
    }

    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          AppImageLoading(
            width: width,
            height: height,
            progress: downloadProgress.progress,
          ),
      errorWidget: (context, url, error) =>
          AppImageError(width: width, height: height, error: '$error'),
    );
  }
}

class AppImageLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final double? progress;

  const AppImageLoading({super.key, this.width, this.height, this.progress});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Skeletonizer(
            child: Container(width: width, height: height, color: Colors.white),
          ),

          if (progress != null && progress! >= 0.0)
            Center(
              child: CircularProgressIndicator(
                value: progress,
                color: colorScheme.primary.withAlpha(150),
                strokeWidth: 3,
              ),
            ),

          if (progress != null && progress! >= 0.0)
            Center(
              child: AnimatedFlipCounter(
                value: progress! * 100,
                fractionDigits: 0,
                suffix: '%',
                textStyle: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AppImageError extends StatelessWidget {
  final double? width;
  final double? height;
  final String? error;

  const AppImageError({super.key, this.width, this.height, this.error});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface.withAlpha(120),
          borderRadius: .circular(8),
          border: .all(color: colorScheme.outlineVariant, width: 1),
        ),
        child: Column(
          spacing: 4,
          mainAxisAlignment: .center,
          children: [
            Icon(
              Icons.broken_image_outlined,
              size: 40,
              color: colorScheme.onSurfaceVariant,
            ),
            if (error != null)
              Text(
                error!,
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
