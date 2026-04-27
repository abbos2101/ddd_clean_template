import 'dart:async';
import 'dart:io';

import 'package:ddd_clean_template/common/widgets/app_image.dart';
import 'package:ddd_clean_template/common/words/words.dart';
import 'package:ddd_clean_template/presentation/dialogs/select_item_dialog.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  const ImageHelper._();

  static Future<void> showImage(dynamic image) async {
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
              child: InteractiveViewer(
                child: AppImage(
                  image,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<String?> pickImage({
    List<ImageSource> sources = const [.camera, .gallery],
    bool compress = true,
  }) async {
    try {
      if (sources.isEmpty) {
        if (kDebugMode) print('pickImage: empty sources');
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

      final file = await ImagePicker().pickImage(
        source: source,
        imageQuality: 100,
      );
      if (file == null) return null;

      final originalFile = File(file.path);
      if (!await originalFile.exists()) return null;

      if (!compress) return originalFile.path;

      return await _enqueue(() => _compress(originalFile));
    } catch (e) {
      if (kDebugMode) print('pickImage error: $e');
      return null;
    }
  }

  static Future<String?> compressFile(File file) async {
    if (!await file.exists()) return null;
    return await _enqueue(() => _compress(file));
  }

  static Future<void> clearTempImages() async {
    try {
      final dir = await getTemporaryDirectory();
      for (final file in dir.listSync()) {
        if (file is File &&
            path.basename(file.path).startsWith('compressed_') &&
            file.path.endsWith('.jpg')) {
          await file.delete();
        }
      }
    } catch (_) {}
  }

  // ─── Private ───────────────────────────────────────────────────────────────
  static Completer<void>? _queue;

  static Future<String?> _enqueue(Future<String?> Function() task) async {
    while (_queue != null) {
      await _queue!.future;
    }
    _queue = Completer<void>();
    try {
      return await task();
    } finally {
      final c = _queue;
      _queue = null;
      c?.complete();
    }
  }

  static Future<String?> _compress(File originalFile) async {
    try {
      final dir = await getTemporaryDirectory();
      final targetPath = path.join(
        dir.path,
        'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      final result = await FlutterImageCompress.compressAndGetFile(
        originalFile.absolute.path,
        targetPath,
        quality: 60,
        minWidth: 1024,
        minHeight: 1024,
        format: CompressFormat.jpeg,
        keepExif: false,
        autoCorrectionAngle: true,
      );

      _safeDelete(originalFile);

      if (result != null) return result.path;
      if (kDebugMode) print('Compress failed, using original');
      return originalFile.path;
    } catch (e) {
      if (kDebugMode) print('Compress error: $e');
      return originalFile.path;
    }
  }

  static void _safeDelete(File file) {
    file.exists().then((exists) {
      if (exists) file.delete().catchError((_) => file);
    });
  }
}
