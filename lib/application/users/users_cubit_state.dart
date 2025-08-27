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
  }) = _UsersCubitState;
}
