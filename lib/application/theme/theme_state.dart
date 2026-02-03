part of 'theme_cubit.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState.initial({@Default(.system) ThemeMode themeMode}) =
      _Initial;
}
