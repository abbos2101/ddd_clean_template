import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@Singleton()
class DBService {
  Future<T?> executeWithAssetDB<T>(
    String assetPath,
    Future<T> Function(Database db) operation, {
    Function(dynamic e)? onError,
  }) async {
    final dbPath = join(await getDatabasesPath(), assetPath.split('/').last);

    if (!await Directory(dirname(dbPath)).exists()) {
      await Directory(dirname(dbPath)).create(recursive: true);
    }

    if (!await File(dbPath).exists()) {
      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List();
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }

    Database? db;
    try {
      db = await openDatabase(dbPath);
      return await operation(db);
    } catch (e) {
      onError?.call(e);
    } finally {
      await db?.close();
    }

    return null;
  }

  Future<T?> executeWithPathDB<T>(
    String dbPath,
    Future<T> Function(Database db) operation, {
    Function(dynamic e)? onError,
  }) async {
    Database? db;
    try {
      db = await openDatabase(dbPath);
      return await operation(db);
    } catch (e) {
      onError?.call(e);
    } finally {
      await db?.close();
    }

    return null;
  }

  Future<T?> executeWithSQL<T>(
    String databaseName,
    List<String> sqls,
    Future<T> Function(Database db) operation, {
    Function(dynamic e)? onError,
  }) async {
    final dbPath = join(await getDatabasesPath(), databaseName);

    Database? db;
    try {
      db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) async {
          for (var sql in sqls) {
            await db.execute(sql);
          }
        },
      );
      return await operation(db);
    } catch (e) {
      onError?.call(e);
    } finally {
      await db?.close();
    }

    return null;
  }
}
