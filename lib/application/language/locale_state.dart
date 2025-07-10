part of 'locale_cubit.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState.initial({
    @Default(Locale('uz', 'UZ')) Locale locale,
    @Default([]) List<Locale> locales,
  }) = _Initial;
}
