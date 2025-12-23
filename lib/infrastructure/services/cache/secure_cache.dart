import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import 'cache_service.dart';

@Singleton()
class SecureCache {
  final CacheService _cacheService;
  late final Box _box;
  final FlutterSecureStorage _secureStorage;
  var _token = '';

  SecureCache(this._cacheService, this._secureStorage) {
    _box = _cacheService.secureBox;
  }

  Future<String> get token async {
    if (_token.isNotEmpty) {
      return _token;
    }
    if (_box.get('has_token', defaultValue: false)) {
      _token = await _secureStorage.read(key: 'token') ?? '';
    }
    return _token;
  }

  Future<void> setToken(String token) async {
    await _box.put('has_token', true);
    await _secureStorage.write(key: 'token', value: token);
    _token = token;
  }

  Future<void> clear() async {
    await _box.clear();
    await _secureStorage.deleteAll();
    _token = '';
  }
}
