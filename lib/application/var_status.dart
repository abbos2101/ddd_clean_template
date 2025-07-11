import 'dart:convert';

import 'package:flutter/material.dart';

/// This mode is used in Blocs to know variable's status.
/// If you need to use to know success, loading, fail
///
/// Examples:
/// [in state]
/// ```dart
///
/// class LocationState with _$LocationState {
///   const factory LocationState.initial({
///     @Default(VarStatus()) VarStatus statusPosition,
///     Position? position,
///   }) = _Initial;
/// }
/// ```
/// [To emit in bloc]
/// ```dart
/// emit(state.copyWith(statusPosition: VarStatus())); // initial
/// emit(state.copyWith(statusPosition: VarStatus.loading()));
/// emit(state.copyWith(statusPosition: VarStatus.success()));
/// emit(state.copyWith(statusPosition: VarStatus.fail()));
/// ```

class VarStatus {
  final bool isInitial;
  final bool isSuccess;
  final bool isLoading;
  final bool isFail;
  final dynamic error;

  const VarStatus({
    this.isInitial = true,
    this.isSuccess = false,
    this.isLoading = false,
    this.isFail = false,
    this.error = '',
  });

  factory VarStatus.initial() => const VarStatus();

  factory VarStatus.loading() =>
      const VarStatus(isInitial: false, isLoading: true);

  factory VarStatus.fail([dynamic error]) =>
      VarStatus(isInitial: false, isFail: true, error: error);

  factory VarStatus.success() =>
      const VarStatus(isInitial: false, isSuccess: true);

  Widget when({
    Widget Function()? initial,
    required Widget Function() loading,
    required Widget Function(dynamic error) fail,
    required Widget Function() success,
  }) {
    if (isLoading) return loading();
    if (isSuccess) return success();
    if (isFail) return fail(error);
    if (initial != null) return initial();
    return const SizedBox();
  }

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => {
    "isInitial": isInitial,
    "isSuccess": isSuccess,
    "isLoading": isLoading,
    "isFail": isFail,
    "error": error,
  };

  String get status {
    if (isFail) return 'fail';
    if (isLoading) return 'loading';
    if (isSuccess) return 'success';
    return 'initial';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VarStatus &&
        other.isInitial == isInitial &&
        other.isSuccess == isSuccess &&
        other.isLoading == isLoading &&
        other.isFail == isFail &&
        other.error == error;
  }

  @override
  int get hashCode {
    return isInitial.hashCode ^
        isSuccess.hashCode ^
        isLoading.hashCode ^
        isFail.hashCode ^
        error.hashCode;
  }
}
