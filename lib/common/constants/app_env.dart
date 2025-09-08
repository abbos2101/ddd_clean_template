import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppEnv {
  static late final String baseUrl;
  static late final String oneIdUrl;
  static late final String username;
  static late final String password;

  static late final bool devMode;
  static late final bool onlyPortrait;

  const AppEnv._();

  static Future<void> init() async {
    const env = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
    await dotenv.load(fileName: ".env.$env");

    baseUrl = dotenv.env['BASE_URL'] ?? '';
    oneIdUrl = dotenv.env['ONE_ID_URL'] ?? '';
    username = dotenv.env['USERNAME'] ?? '';
    password = dotenv.env['PASSWORD'] ?? '';

    devMode = bool.tryParse(dotenv.env['DEV_MODE'] ?? 'false') ?? false;
    onlyPortrait =
        bool.tryParse(dotenv.env['ONLY_PORTRAIT'] ?? 'false') ?? false;
  }
}
