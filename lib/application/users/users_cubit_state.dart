part of 'users_cubit.dart';

@freezed
abstract class UsersCubitState with _$UsersCubitState {
  const factory UsersCubitState({
    /// Main users list status - simple like template 🏪
    @Default(VarStatus()) VarStatus usersStatus,
    @Default([]) List<UserModel> users,

    /// Search functionality status - simple like template 🔍
    @Default(VarStatus()) VarStatus searchStatus,
    @Default([]) List<UserModel> searchResults,
    @Default('') String searchQuery,

    /// Distance sorting status - simple like template 📍
    @Default(VarStatus()) VarStatus distanceStatus,

    /// Batch processing status - simple like template ⚡
    @Default(VarStatus()) VarStatus batchStatus,

    /// Processing progress (0-100) - simple like template 📊
    @Default(0.0) double processingProgress,

    /// Processing time in milliseconds - simple like template ⏱️
    @Default(0) int processingTimeMs,
  }) = _UsersCubitState;
}
