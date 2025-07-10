import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ddd_clean_template/infrastructure/services/cache/app_cache.dart';

part 'theme_cubit.freezed.dart';

part 'theme_state.dart';

@Injectable()
class ThemeCubit extends Cubit<ThemeState> {
  final AppCache _cache;

  ThemeCubit(this._cache) : super(const ThemeState.initial());

  void init() {
    final themeMode =
        ThemeMode.values.where((e) => e.name == _cache.theme).firstOrNull ??
        ThemeMode.system;
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> change(ThemeMode themeMode) async {
    emit(state.copyWith(themeMode: themeMode));
    await _cache.setTheme(themeMode.name);
  }

  Future<void> toggle() async {
    final themeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    emit(state.copyWith(themeMode: themeMode));
    await _cache.setTheme(themeMode.name);
  }
}
