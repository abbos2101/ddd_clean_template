import 'dart:io';

import 'package:ddd_clean_template/common/widgets/app_image.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../theme/themes.dart';
import '../words/words.dart';

class ImageHelper {
  const ImageHelper._();

  static Future<void> showImage(dynamic image) async {
    await showDialog(
      context: router.navigatorKey.currentContext!,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: [
              const Row(
                children: [
                  Spacer(),
                  Icon(Icons.close, color: Colors.white, size: 36),
                  SizedBox(width: 12),
                ],
              ),

              Expanded(
                child: InteractiveViewer(
                  child: AppImage(
                    image,
                    width: double.infinity,
                    fit: .fitWidth,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<ImageSource?> getImageSource() {
    return _ImageHelperImpl._getImageSource();
  }

  static Future<String?> pickImage({
    ImageSource source = ImageSource.camera,
    bool withCrop = false,
  }) async {
    try {
      final file = await ImagePicker().pickImage(
        source: source,
        imageQuality: 85,
      );

      if (file == null) {
        return null;
      }

      final originalFile = File(file.path);
      if (!await originalFile.exists()) {
        return null;
      }

      String? processedPath = file.path;

      if (withCrop) {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: originalFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: false,
            ),
            IOSUiSettings(title: 'Crop'),
          ],
        );

        if (croppedFile == null) {
          return null;
        }

        processedPath = croppedFile.path;
      }

      final fileToCompress = File(processedPath);
      final fixedAndCompressedPath =
          await _ImageHelperImpl._fixAndCompressImage(fileToCompress);
      return fixedAndCompressedPath;
    } catch (e) {
      if (kDebugMode) {
        print('Error picking image: $e');
      }
      return null;
    }
  }

  static Future<String?> pickMultipleImages({
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      if (source == ImageSource.camera) {
        return await pickImage(source: source);
      }

      final files = await ImagePicker().pickMultiImage(imageQuality: 85);

      if (files.isEmpty) {
        return null;
      }

      final processedPaths = <String>[];

      for (final file in files) {
        final originalFile = File(file.path);
        if (await originalFile.exists()) {
          final fixedPath = await _ImageHelperImpl._fixAndCompressImage(
            originalFile,
          );
          if (fixedPath != null) {
            processedPaths.add(fixedPath);
          }
        }
      }

      return processedPaths.isNotEmpty ? processedPaths.first : null;
    } catch (_) {
      return null;
    }
  }
}

class _ImageHelperImpl {
  const _ImageHelperImpl._();

  static Future<ImageSource?> _getImageSource() async {
    final context = router.navigatorKey.currentContext!;
    final colors = context.appColors;

    return await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const .all(16),
            child: Column(
              spacing: 16,
              mainAxisSize: .min,
              children: [
                Container(
                  width: 50,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: colors.border,
                    shape: RoundedRectangleBorder(borderRadius: .circular(12)),
                  ),
                ),
                Text(
                  Words.uploadImage.str,
                  style: const TextStyle(fontSize: 18, fontWeight: .bold),
                ),
                CupertinoButton(
                  color: colors.border,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      Words.openCamera.str,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: colors.onSurface),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                CupertinoButton(
                  color: colors.border,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      Words.openGallery.str,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: colors.onSurface),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<String?> _fixAndCompressImage(File originalFile) async {
    try {
      final directory = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'fixed_compressed_$timestamp.jpg';
      final targetPath = path.join(directory.path, fileName);

      final result = await FlutterImageCompress.compressAndGetFile(
        originalFile.absolute.path,
        targetPath,
        quality: 85,
        minWidth: 1024,
        minHeight: 1024,
        format: CompressFormat.jpeg,
        keepExif: false,
        autoCorrectionAngle: true,
      );

      if (result == null) {
        return await _fallbackFix(originalFile);
      }

      final resultFile = File(result.path);
      final compressedSize = await resultFile.length();
      if (compressedSize > 300 * 1024) {
        return await _furtherCompress(resultFile);
      }

      await _deleteOriginalFile(originalFile);
      return result.path;
    } catch (e) {
      return await _fallbackFix(originalFile);
    }
  }

  static Future<String?> _fallbackFix(File originalFile) async {
    try {
      final bytes = await originalFile.readAsBytes();
      final result = await FlutterImageCompress.compressWithList(
        bytes,
        quality: 80,
        minWidth: 800,
        minHeight: 800,
        format: CompressFormat.jpeg,
        keepExif: false,
        autoCorrectionAngle: true,
      );

      final directory = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'fallback_$timestamp.jpg';
      final targetPath = path.join(directory.path, fileName);

      final file = File(targetPath);
      await file.writeAsBytes(result);

      await _deleteOriginalFile(originalFile);
      return file.path;
    } catch (e) {
      return originalFile.path;
    }
  }

  static Future<String?> _furtherCompress(File file) async {
    try {
      final directory = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'ultra_compressed_$timestamp.jpg';
      final targetPath = path.join(directory.path, fileName);

      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 70,
        minWidth: 800,
        minHeight: 800,
        format: CompressFormat.jpeg,
        keepExif: false,
      );

      if (result != null) {
        await file.delete();
        return result.path;
      }

      return file.path;
    } catch (e) {
      return file.path;
    }
  }

  static Future<void> _deleteOriginalFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {}
  }
}
