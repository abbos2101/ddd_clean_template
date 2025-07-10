import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@Singleton()
class CacheService {
  late Box _appBox;
  late Box _secureBox;
  var _isInitialized = false;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final path = kIsWeb ? '/' : (await getTemporaryDirectory()).path;
    Hive.init(path);

    _appBox = await Hive.openBox('app');
    _secureBox = await Hive.openBox('secure');
    _isInitialized = true;
  }

  Box get appBox => _appBox;

  Box get secureBox => _secureBox;

  bool get isInitialized => _isInitialized;
}
