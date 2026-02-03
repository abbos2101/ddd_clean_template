import 'package:bloc/bloc.dart';
import 'package:ddd_clean_template/infrastructure/services/cache/app_cache.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

@Injectable()
class ThemeCubit extends Cubit<ThemeState> {
  final AppCache _cache;

  ThemeCubit(this._cache) : super(const .initial());

  void init() {
    final themeMode =
        ThemeMode.values.where((e) => e.name == _cache.theme).firstOrNull ??
        .system;
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> change(ThemeMode themeMode) async {
    emit(state.copyWith(themeMode: themeMode));
    await _cache.setTheme(themeMode.name);
  }

  Future<void> toggle() async {
    final themeMode = state.themeMode == .light
        ? ThemeMode.dark
        : ThemeMode.light;

    emit(state.copyWith(themeMode: themeMode));
    await _cache.setTheme(themeMode.name);
  }
}
