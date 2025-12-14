import 'package:ddd_clean_template/common/extensions/string_extensions.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

/// Abstract class providing CRUD operations for database entities.
///
/// This class implements common database operations following best practices
/// for SQLite operations in Flutter applications.
@Injectable()
class DBCrud<T> {
  /// Retrieves all records from the specified table.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [fromJson] - Function to convert Map to entity
  /// [orderBy] - Optional ordering clause
  /// [limit] - Optional limit for results
  ///
  /// Returns list of entities or empty list if none found.
  Future<List<T>> getAll(
    Database db, {
    required T Function(Map<String, dynamic> e) fromJson,
    String? orderBy,
    int? limit,
  }) async {
    final list = await db.query(T.tableName, orderBy: orderBy, limit: limit);
    return list.map((e) => fromJson(e)).toList();
  }

  /// Retrieves a single record by ID.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [id] - Record identifier
  /// [fromJson] - Function to convert Map to entity
  ///
  /// Returns entity or null if not found.
  Future<T?> getById(
    Database db, {
    required String id,
    required T Function(Map<String, dynamic> p1) fromJson,
  }) async {
    final list = await db.query(
      T.tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (list.isEmpty) return null;
    return fromJson(list.first);
  }

  /// Retrieves records matching the specified condition.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [fromJson] - Function to convert Map to entity
  /// [where] - WHERE clause condition
  /// [whereArgs] - Arguments for WHERE clause
  /// [orderBy] - Optional ordering clause
  /// [limit] - Optional limit for results
  /// [offset] - Optional offset for pagination
  ///
  /// Returns list of matching entities.
  Future<List<T>> getWhere(
    Database db, {
    required T Function(Map<String, dynamic> e) fromJson,
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final list = await db.query(
      T.tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
    return list.map((e) => fromJson(e)).toList();
  }

  /// Retrieves the first record matching the condition.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [fromJson] - Function to convert Map to entity
  /// [where] - WHERE clause condition
  /// [whereArgs] - Arguments for WHERE clause
  /// [orderBy] - Optional ordering clause
  ///
  /// Returns first matching entity or null if none found.
  Future<T?> getFirst(
    Database db, {
    required T Function(Map<String, dynamic> e) fromJson,
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    final list = await db.query(
      T.tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: 1,
    );
    if (list.isEmpty) return null;
    return fromJson(list.first);
  }

  /// Counts total records in the table.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [where] - Optional WHERE clause condition
  /// [whereArgs] - Optional arguments for WHERE clause
  ///
  /// Returns count of records.
  Future<int> count(
    Database db, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final result = await db.query(
      T.tableName,
      columns: ['COUNT(*) as count'],
      where: where,
      whereArgs: whereArgs,
    );
    return result.first['count'] as int;
  }

  /// Checks if a record exists by ID.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [id] - Record identifier
  ///
  /// Returns true if record exists, false otherwise.
  Future<bool> exists(Database db, {required String id}) async {
    final count = await this.count(db, where: 'id = ?', whereArgs: [id]);
    return count > 0;
  }

  /// Inserts a new record into the database.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [model] - Entity to insert
  /// [conflictAlgorithm] - How to handle conflicts (default: abort)
  ///
  /// Returns the row ID of the inserted record.
  /// Throws exception if insert fails.
  Future<int> insert(
    Database db, {
    required T model,
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.abort,
  }) async => await db.insert(
    T.tableName,
    (model as dynamic).toJson(),
    conflictAlgorithm: conflictAlgorithm,
  );

  /// Inserts multiple records in a single transaction.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [models] - List of entities to insert
  /// [conflictAlgorithm] - How to handle conflicts (default: abort)
  ///
  /// Returns list of row IDs for inserted records.
  Future<List<int>> insertBatch(
    Database db, {
    required List<T> models,
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.abort,
  }) async {
    final batch = db.batch();
    for (final model in models) {
      batch.insert(
        T.tableName,
        (model as dynamic).toJson(),
        conflictAlgorithm: conflictAlgorithm,
      );
    }
    final results = await batch.commit();
    return results.cast<int>();
  }

  /// Updates an existing record.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [model] - Entity with updated data
  /// [conflictAlgorithm] - How to handle conflicts (default: abort)
  ///
  /// Returns number of affected rows.
  Future<int> update(
    Database db, {
    required T model,
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.abort,
  }) async {
    final json = (model as dynamic).toJson();
    final id = json['id'];

    return await db.update(
      T.tableName,
      json,
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  /// Updates records matching the specified condition.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [values] - Map of column-value pairs to update
  /// [where] - WHERE clause condition
  /// [whereArgs] - Arguments for WHERE clause
  /// [conflictAlgorithm] - How to handle conflicts (default: abort)
  ///
  /// Returns number of affected rows.
  Future<int> updateWhere(
    Database db, {
    required Map<String, Object?> values,
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.abort,
  }) async => await db.update(
    T.tableName,
    values,
    where: where,
    whereArgs: whereArgs,
    conflictAlgorithm: conflictAlgorithm,
  );

  /// Inserts or updates a record (upsert operation).
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [model] - Entity to insert or update
  ///
  /// Returns true if inserted, false if updated.
  Future<bool> insertOrUpdate(Database db, {required T model}) async {
    final json = (model as dynamic).toJson();
    final id = json['id'];

    final recordExists = await exists(db, id: id);

    if (recordExists) {
      await update(db, model: model);
      return false;
    } else {
      await insert(db, model: model);
      return true;
    }
  }

  /// Deletes a record by ID.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [id] - Record identifier
  ///
  /// Returns number of affected rows.
  Future<int> delete(Database db, {required dynamic id}) async =>
      await db.delete(T.tableName, where: 'id = ?', whereArgs: [id]);

  /// Deletes records matching the specified condition.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  /// [where] - WHERE clause condition
  /// [whereArgs] - Arguments for WHERE clause
  ///
  /// Returns number of affected rows.
  Future<int> deleteWhere(
    Database db, {
    String? where,
    List<Object?>? whereArgs,
  }) async => await db.delete(T.tableName, where: where, whereArgs: whereArgs);

  /// Deletes all records from the table.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  ///
  /// Returns number of affected rows.
  Future<int> deleteAll(Database db) async => await db.delete(T.tableName);

  /// Executes a raw SQL query and returns results.
  ///
  /// [db] - Database instance
  /// [sql] - SQL query string
  /// [arguments] - Optional query arguments
  ///
  /// Returns list of result maps.
  Future<List<Map<String, dynamic>>> rawQuery(
    Database db,
    String sql, [
    List<Object?>? arguments,
  ]) async => await db.rawQuery(sql, arguments);

  /// Executes a raw SQL statement.
  ///
  /// [db] - Database instance
  /// [sql] - SQL statement string
  /// [arguments] - Optional statement arguments
  ///
  /// Returns number of affected rows.
  Future<int> rawExecute(
    Database db,
    String sql, [
    List<Object?>? arguments,
  ]) async => await db.rawUpdate(sql, arguments);

  /// Retrieves the table structure as CREATE TABLE statement.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  ///
  /// Returns the SQL CREATE TABLE statement string or null if table not found.
  Future<String?> getTableStructure(Database db) async {
    final result = await db.rawQuery(
      "SELECT sql FROM sqlite_master WHERE type='table' AND name=?",
      [T.tableName],
    );

    if (result.isEmpty) return null;
    return result.first['sql'] as String?;
  }

  /// Checks if a table exists in the database.
  ///
  /// [T] - The entity type
  /// [db] - Database instance
  ///
  /// Returns true if table exists, false otherwise.
  Future<bool> tableExists(Database db) async {
    final result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [T.tableName],
    );
    return result.isNotEmpty;
  }
}

/// Extension to convert Type to database table name.
extension DbCrudTable on Type {
  /// Converts the type name to snake_case table name.
  ///
  /// Handles Freezed generated classes and removes common suffixes.
  String get tableName {
    var typeName = toString();

    // Remove Freezed generated prefix
    if (typeName.startsWith('_\$')) {
      typeName = typeName.substring(2);
    }

    // Remove common suffixes
    if (typeName.endsWith('Impl')) {
      typeName = typeName.substring(0, typeName.length - 4);
    }
    if (typeName.endsWith('Model')) {
      typeName = typeName.substring(0, typeName.length - 5);
    }

    return typeName.toSnakeCase();
  }
}
