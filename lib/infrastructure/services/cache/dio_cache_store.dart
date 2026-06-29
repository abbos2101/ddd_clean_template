import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DioCacheStore extends HiveCacheStore {
  DioCacheStore() : super(null);

  Future<void> clearAll() async {
    final box = await openBox();
    await box.deleteAll(await box.keys);
  }

  Future<void> clearExpiredCache() => clean(staleOnly: true);

  Future<void> clearOlderThan(Duration duration) async {
    final box = await openBox();
    final cutoff = DateTime.now().subtract(duration);
    final expired = <String>[];
    for (final key in await box.keys) {
      final resp = await box.get(key);
      if (resp != null && resp.responseDate.isBefore(cutoff)) {
        expired.add(key);
      }
    }
    await box.deleteAll(expired);
  }
}
