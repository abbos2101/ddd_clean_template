import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  const ImageHelper._();

  static Future<String?> pickImage({
    ImageSource source = ImageSource.camera,
  }) async {
    try {
      final file = await ImagePicker().pickImage(
        source: source,
        imageQuality: 85,
      );

      if (file == null) return null;

      final originalFile = File(file.path);
      if (!await originalFile.exists()) return null;

      final fixedAndCompressedPath = await _fixAndCompressImage(originalFile);
      return fixedAndCompressedPath;
    } catch (e) {
      if (kDebugMode) print('Error picking image: $e');
      return null;
    }
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

  static Future<String?> pickMultipleImages({
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      if (source == ImageSource.camera) {
        return await pickImage(source: source);
      }

      final files = await ImagePicker().pickMultiImage(imageQuality: 85);

      if (files.isEmpty) return null;

      final List<String> processedPaths = [];

      for (final file in files) {
        final originalFile = File(file.path);
        if (await originalFile.exists()) {
          final fixedPath = await _fixAndCompressImage(originalFile);
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
