import 'package:ddd_clean_template/infrastructure/services/cache/app_cache.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'locale_cubit.freezed.dart';
part 'locale_state.dart';

@Injectable()
class LocaleCubit extends Cubit<LocaleState> {
  final AppCache _cache;

  LocaleCubit(this._cache) : super(const .initial());

  void init(List<Locale> supportedLocales) {
    emit(
      state.copyWith(
        locale: Locale(
          _cache.locale.isEmpty
              ? supportedLocales.first.languageCode
              : _cache.locale,
        ),
        locales: supportedLocales,
      ),
    );
  }

  Future<void> change(String locale) async {
    await router.navigatorKey.currentContext!.setLocale(Locale(locale));
    await _cache.setLocale(locale);
    emit(state.copyWith(locale: Locale(locale)));
  }
}
