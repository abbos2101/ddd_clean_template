# Datasource Generation Skill

## Overview
Generate Flutter datasource classes from Facade interface, Model, and API documentation (cURL, Swagger YAML, or Postman Collection).

## Architecture Pattern
```
Facade (abstract) → DataSource (implementation) → HttpService → API
```

## Input Requirements
Minimum **two** of: `Facade`, `Model`, `cURL/Swagger/Postman`

## Code Structure
```dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: {FacadeName})
class {Name}DataSource implements {FacadeName} {
  final HttpService _http;
  const {Name}DataSource(this._http);

  @override
  Future<Either<dynamic, {ReturnType}>> {methodName}({params}) async {
    final client = _http.client(requiredToken: {true/false}, cacheDuration: cacheDuration);
    const path = '{endpoint}';

    try {
      final response = await client.{get/post/put/delete}(path);
      final result = {Model}.fromJson(response.data);
      return Right(result);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<void> clearCache() => _http.clearCache();
}
```

## Variable Declaration Order (MANDATORY)

**Before try-catch:**
1. `client` - HTTP client
2. `path` - Endpoint
3. `headers` - Custom headers (if needed)
4. `queryParameters` - Query params (if needed)
5. `data` - Request body (if needed)

**Inside try-catch:**
- Non-void: `response` → `result` → `return Right(result)`
- Void: `return const Right(null)` (no response, no result)

**Inside catch:**
- Always: `return Left(e);`

## Examples

### Single Object
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';

try {
  final response = await client.get(path);
  final result = Model.fromJson(response.data);
  return Right(result);
} catch (e) {
  return Left(e);
}
```

### List
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';

try {
  final response = await client.get(path);
  final result = ((response.data ?? []) as List)
      .map((e) => Model.fromJson(e))
      .toList();
  return Right(result);
} catch (e) {
  return Left(e);
}
```

### Pagination
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';

try {
  final response = await client.get(path);
  final result = PaginationModel.fromJson(
    response.data,
    (e) => Model.fromJson(e),
  );
  return Right(result);
} catch (e) {
  return Left(e);
}
```

### Single Field
```dart
final client = _http.client(requiredToken: false);
const path = '/api/endpoint';

try {
  final response = await client.get(path);
  final result = response.data['field_name'] ?? '';
  return Right(result);
} catch (e) {
  return Left(e);
}
```

### Void Return
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';

try {
  await client.post(path);
  return const Right(null);
} catch (e) {
  return Left(e);
}
```

### POST with JSON Data
```dart
final client = _http.client(requiredToken: false);
const path = '/api/endpoint';
final data = {'param1': param1, 'param2': param2};

try {
  final response = await client.post(path, data: data);
  final result = Model.fromJson(response.data);
  return Right(result);
} catch (e) {
  return Left(e);
}
```

### GET with Query Parameters
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';
final queryParameters = {
  'search': search,
  if (page != null) 'page': page.toString(),
};

try {
  final response = await client.get(path, queryParameters: queryParameters);
  final result = Model.fromJson(response.data);
  return Right(result);
} catch (e) {
  return Left(e);
}
```

### POST with List to List of Maps
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';
final data = {
  'field1': field1,
  'items': items.map((e) => {'key': e}).toList(),
};

try {
  await client.post(path, data: data);
  return const Right(null);
} catch (e) {
  return Left(e);
}
```

### POST with FormData
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';
final data = FormData.fromMap({'field1': field1, 'field2': field2.toString()});

// Add arrays
for (int i = 0; i < items.length; i++) {
  data.fields.add(MapEntry('items[]', items[i]));
}

// Add files
for (int i = 0; i < filePaths.length; i++) {
  data.files.add(MapEntry('files', await MultipartFile.fromFile(filePaths[i])));
}

try {
  await client.post(path, data: data);
  return const Right(null);
} catch (e) {
  return Left(e);
}
```

### Custom Headers
```dart
final client = _http.client(requiredToken: true);
const path = '/api/endpoint';
final headers = {'Custom-Header': 'value'};

try {
  final response = await client.get(path, options: Options(headers: headers));
  final result = Model.fromJson(response.data);
  return Right(result);
} catch (e) {
  return Left(e);
}
```

## Rules

1. **Order**: `client` → `path` → `headers` → `queryParameters` → `data` → try-catch
2. **List to List of Maps**: Use `.map((e) => {'key': e}).toList()` in `data` object
3. **FormData**: Use `FormData.fromMap({})` with for-loop for arrays
4. **Non-void**: `response` → `result` → `Right(result)`
5. **Void**: No response/result → `const Right(null)`
6. **Catch**: Always `Left(e)`
7. **Null-safety**: `response.data ?? []`
8. Path variables: `/api/resource/$id`
9. Use `@Injectable(as: FacadeName)`

## File Location