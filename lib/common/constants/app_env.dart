abstract final class AppEnv {
  static const baseUrl = String.fromEnvironment('BASE_URL');
  static const oneIdUrl = String.fromEnvironment('ONE_ID_URL');
  static const username = String.fromEnvironment('USERNAME');
  static const password = String.fromEnvironment('PASSWORD');

  static const devMode = bool.fromEnvironment('DEV_MODE');
  static const onlyPortrait = bool.fromEnvironment('ONLY_PORTRAIT');

  static const cacheDurationShort = Duration(
    seconds: int.fromEnvironment('CACHE_DURATION_SHORT', defaultValue: 900),
  );
  static const cacheDurationLong = Duration(
    seconds: int.fromEnvironment('CACHE_DURATION_LONG', defaultValue: 1209600),
  );
}
