import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import 'cache_service.dart';

@Injectable()
class AppCache {
  final CacheService _cacheService;
  late final Box _box;

  AppCache(this._cacheService) {
    _box = _cacheService.appBox;
  }

  String get locale => _box.get('locale') ?? '';

  Future<void> setLocale(String locale) => _box.put('locale', locale);

  String get theme => _box.get('theme') ?? '';

  Future<void> setTheme(String theme) => _box.put('theme', theme);
}
