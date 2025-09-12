abstract class AppEnv {
  const AppEnv._();

  static const baseUrl = String.fromEnvironment('BASE_URL');
  static const oneIdUrl = String.fromEnvironment('ONE_ID_URL');
  static const username = String.fromEnvironment('USERNAME');
  static const password = String.fromEnvironment('PASSWORD');

  static const devMode = bool.fromEnvironment('DEV_MODE');
  static const onlyPortrait = bool.fromEnvironment('ONLY_PORTRAIT');
}
