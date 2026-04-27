import 'dart:io';

import 'package:ddd_clean_template/common/widgets/app_video.dart';
import 'package:ddd_clean_template/common/words/words.dart';
import 'package:ddd_clean_template/presentation/dialogs/select_item_dialog.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoHelper {
  const VideoHelper._();

  static Future<void> showVideo(dynamic video) async {
    await showDialog(
      context: router.navigatorKey.currentContext!,
      builder: (context) => GestureDetector(
        onTap: () => Navigator.pop(context),
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            const Row(
              children: [
                Spacer(),
                Icon(Icons.close, color: Colors.white, size: 36),
              ],
            ),
            Expanded(
              child: Center(
                child: AppVideo(
                  video,
                  width: double.infinity,
                  autoPlay: true,
                  muted: false,
                  showControls: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<String?> pickVideo({
    List<ImageSource> sources = const [.camera, .gallery],
    int? maxFileSizeBytes,
    Duration? maxVideoDuration,
  }) async {
    try {
      if (sources.isEmpty) {
        if (kDebugMode) print('pickVideo: empty sources');
        return null;
      }

      final ImageSource? source;
      if (sources.length == 1) {
        source = sources.first;
      } else {
        final context = router.navigatorKey.currentContext!;
        source = await SelectItemDialog<ImageSource>(
          mode: SelectItemMode.wrap,
          fetchItems: () => sources,
          labelFrom: (e) => 'select_from_${e.name}'.str,
          itemBuilder: (e, isSelected) {
            return Text(
              'select_from_${e.name}'.str,
              style: const TextStyle(fontSize: 20),
            );
          },
        ).show(context);
        if (source == null) return null;
      }

      final file = await ImagePicker().pickVideo(
        source: source,
        maxDuration: maxVideoDuration,
      );
      if (file == null) return null;

      final originalFile = File(file.path);
      if (!await originalFile.exists()) return null;

      if (maxFileSizeBytes != null) {
        final size = await originalFile.length();
        if (size > maxFileSizeBytes) {
          if (kDebugMode) {
            print('pickVideo: file too large ($size > $maxFileSizeBytes)');
          }
          _safeDelete(originalFile);
          return null;
        }
      }

      return originalFile.path;
    } catch (e) {
      if (kDebugMode) print('pickVideo error: $e');
      return null;
    }
  }

  // ─── Private ───────────────────────────────────────────────────────────────
  static void _safeDelete(File file) {
    file.exists().then((exists) {
      if (exists) file.delete().catchError((_) => file);
    });
  }
}
