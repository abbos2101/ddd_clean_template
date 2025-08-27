import 'dart:isolate';
import 'dart:math';
import 'package:flutter/foundation.dart';

import '../../domain/models/user_model.dart';

/// Heavy data processing utilities with isolate support
class HeavyDataProcessor {
  /// Process large JSON data in isolate
  static Future<List<UserModel>> processUsersInIsolate(
    List<Map<String, dynamic>> rawData,
  ) async {
    if (rawData.length < 100) {
      // For small data, process on main thread
      return rawData.map((json) => UserModel.fromJson(json)).toList();
    }

    // For large data, use isolate
    final receivePort = ReceivePort();

    await Isolate.spawn(_processUsersIsolate, {
      'sendPort': receivePort.sendPort,
      'data': rawData,
    });

    final result = await receivePort.first as List<Map<String, dynamic>>;
    receivePort.close();

    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  /// Isolate entry point for heavy processing
  static void _processUsersIsolate(Map<String, dynamic> params) {
    final sendPort = params['sendPort'] as SendPort;
    final rawData = params['data'] as List<Map<String, dynamic>>;

    try {
      // Simulate heavy processing
      final processedData = rawData.map((json) {
        // Add computed fields, data enrichment, etc.
        final processed = Map<String, dynamic>.from(json);

        // Heavy computation: Calculate distance, process strings, etc.
        if (processed['address'] != null &&
            processed['address']['geo'] != null) {
          final geo = processed['address']['geo'];
          final lat = double.tryParse(geo['lat'].toString()) ?? 0.0;
          final lng = double.tryParse(geo['lng'].toString()) ?? 0.0;

          // Calculate distance from center (0,0)
          final distance = sqrt(lat * lat + lng * lng);
          processed['computedDistance'] = distance;
        }

        // String processing
        processed['processedName'] = _processName(processed['name'].toString());

        return processed;
      }).toList();

      sendPort.send(processedData);
    } catch (e) {
      sendPort.send(<Map<String, dynamic>>[]);
    }
  }

  /// Heavy string processing
  static String _processName(String name) {
    // Simulate heavy string operations
    return name
        .toLowerCase()
        .split(' ')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : '',
        )
        .join(' ');
  }

  /// Calculate distance between two geo points
  static double calculateDistance(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) {
    const double earthRadius = 6371; // km

    final dLat = _toRadians(lat2 - lat1);
    final dLng = _toRadians(lng2 - lng1);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLng / 2) *
            sin(dLng / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }

  /// Concurrent search across multiple fields
  static Future<List<UserModel>> concurrentSearch(
    List<UserModel> users,
    String query,
  ) async {
    if (users.length < 50) {
      return _simpleSearch(users, query);
    }

    // Split into chunks for concurrent processing
    const chunkSize = 25;
    final chunks = <List<UserModel>>[];

    for (int i = 0; i < users.length; i += chunkSize) {
      final end = (i + chunkSize < users.length) ? i + chunkSize : users.length;
      chunks.add(users.sublist(i, end));
    }

    // Process chunks concurrently
    final futures = chunks.map(
      (chunk) => compute(_searchInChunk, {'users': chunk, 'query': query}),
    );

    final results = await Future.wait(futures);

    return results.expand((list) => list).toList();
  }

  static List<UserModel> _searchInChunk(Map<String, dynamic> params) {
    final users = params['users'] as List<UserModel>;
    final query = params['query'] as String;
    return _simpleSearch(users, query);
  }

  static List<UserModel> _simpleSearch(List<UserModel> users, String query) {
    final lowerQuery = query.toLowerCase();
    return users.where((user) {
      return user.name.toLowerCase().contains(lowerQuery) ||
          user.email.toLowerCase().contains(lowerQuery) ||
          user.username.toLowerCase().contains(lowerQuery) ||
          user.company.name.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
