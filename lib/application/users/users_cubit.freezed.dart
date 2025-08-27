// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersCubitState {

/// Main users list status - simple like template 🏪
 VarStatus get usersStatus; List<UserModel> get users;/// Search functionality status - simple like template 🔍
 VarStatus get searchStatus; List<UserModel> get searchResults; String get searchQuery;/// Distance sorting status - simple like template 📍
 VarStatus get distanceStatus;/// Batch processing status - simple like template ⚡
 VarStatus get batchStatus;/// Processing progress (0-100) - simple like template 📊
 double get processingProgress;/// Processing time in milliseconds - simple like template ⏱️
 int get processingTimeMs;
/// Create a copy of UsersCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersCubitStateCopyWith<UsersCubitState> get copyWith => _$UsersCubitStateCopyWithImpl<UsersCubitState>(this as UsersCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersCubitState&&(identical(other.usersStatus, usersStatus) || other.usersStatus == usersStatus)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.distanceStatus, distanceStatus) || other.distanceStatus == distanceStatus)&&(identical(other.batchStatus, batchStatus) || other.batchStatus == batchStatus)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.processingTimeMs, processingTimeMs) || other.processingTimeMs == processingTimeMs));
}


@override
int get hashCode => Object.hash(runtimeType,usersStatus,const DeepCollectionEquality().hash(users),searchStatus,const DeepCollectionEquality().hash(searchResults),searchQuery,distanceStatus,batchStatus,processingProgress,processingTimeMs);

@override
String toString() {
  return 'UsersCubitState(usersStatus: $usersStatus, users: $users, searchStatus: $searchStatus, searchResults: $searchResults, searchQuery: $searchQuery, distanceStatus: $distanceStatus, batchStatus: $batchStatus, processingProgress: $processingProgress, processingTimeMs: $processingTimeMs)';
}


}

/// @nodoc
abstract mixin class $UsersCubitStateCopyWith<$Res>  {
  factory $UsersCubitStateCopyWith(UsersCubitState value, $Res Function(UsersCubitState) _then) = _$UsersCubitStateCopyWithImpl;
@useResult
$Res call({
 VarStatus usersStatus, List<UserModel> users, VarStatus searchStatus, List<UserModel> searchResults, String searchQuery, VarStatus distanceStatus, VarStatus batchStatus, double processingProgress, int processingTimeMs
});




}
/// @nodoc
class _$UsersCubitStateCopyWithImpl<$Res>
    implements $UsersCubitStateCopyWith<$Res> {
  _$UsersCubitStateCopyWithImpl(this._self, this._then);

  final UsersCubitState _self;
  final $Res Function(UsersCubitState) _then;

/// Create a copy of UsersCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usersStatus = null,Object? users = null,Object? searchStatus = null,Object? searchResults = null,Object? searchQuery = null,Object? distanceStatus = null,Object? batchStatus = null,Object? processingProgress = null,Object? processingTimeMs = null,}) {
  return _then(_self.copyWith(
usersStatus: null == usersStatus ? _self.usersStatus : usersStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,distanceStatus: null == distanceStatus ? _self.distanceStatus : distanceStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,batchStatus: null == batchStatus ? _self.batchStatus : batchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as double,processingTimeMs: null == processingTimeMs ? _self.processingTimeMs : processingTimeMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersCubitState].
extension UsersCubitStatePatterns on UsersCubitState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersCubitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersCubitState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersCubitState value)  $default,){
final _that = this;
switch (_that) {
case _UsersCubitState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersCubitState value)?  $default,){
final _that = this;
switch (_that) {
case _UsersCubitState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VarStatus usersStatus,  List<UserModel> users,  VarStatus searchStatus,  List<UserModel> searchResults,  String searchQuery,  VarStatus distanceStatus,  VarStatus batchStatus,  double processingProgress,  int processingTimeMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersCubitState() when $default != null:
return $default(_that.usersStatus,_that.users,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.distanceStatus,_that.batchStatus,_that.processingProgress,_that.processingTimeMs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VarStatus usersStatus,  List<UserModel> users,  VarStatus searchStatus,  List<UserModel> searchResults,  String searchQuery,  VarStatus distanceStatus,  VarStatus batchStatus,  double processingProgress,  int processingTimeMs)  $default,) {final _that = this;
switch (_that) {
case _UsersCubitState():
return $default(_that.usersStatus,_that.users,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.distanceStatus,_that.batchStatus,_that.processingProgress,_that.processingTimeMs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VarStatus usersStatus,  List<UserModel> users,  VarStatus searchStatus,  List<UserModel> searchResults,  String searchQuery,  VarStatus distanceStatus,  VarStatus batchStatus,  double processingProgress,  int processingTimeMs)?  $default,) {final _that = this;
switch (_that) {
case _UsersCubitState() when $default != null:
return $default(_that.usersStatus,_that.users,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.distanceStatus,_that.batchStatus,_that.processingProgress,_that.processingTimeMs);case _:
  return null;

}
}

}

/// @nodoc


class _UsersCubitState implements UsersCubitState {
  const _UsersCubitState({this.usersStatus = const VarStatus(), final  List<UserModel> users = const [], this.searchStatus = const VarStatus(), final  List<UserModel> searchResults = const [], this.searchQuery = '', this.distanceStatus = const VarStatus(), this.batchStatus = const VarStatus(), this.processingProgress = 0.0, this.processingTimeMs = 0}): _users = users,_searchResults = searchResults;
  

/// Main users list status - simple like template 🏪
@override@JsonKey() final  VarStatus usersStatus;
 final  List<UserModel> _users;
@override@JsonKey() List<UserModel> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

/// Search functionality status - simple like template 🔍
@override@JsonKey() final  VarStatus searchStatus;
 final  List<UserModel> _searchResults;
@override@JsonKey() List<UserModel> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override@JsonKey() final  String searchQuery;
/// Distance sorting status - simple like template 📍
@override@JsonKey() final  VarStatus distanceStatus;
/// Batch processing status - simple like template ⚡
@override@JsonKey() final  VarStatus batchStatus;
/// Processing progress (0-100) - simple like template 📊
@override@JsonKey() final  double processingProgress;
/// Processing time in milliseconds - simple like template ⏱️
@override@JsonKey() final  int processingTimeMs;

/// Create a copy of UsersCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersCubitStateCopyWith<_UsersCubitState> get copyWith => __$UsersCubitStateCopyWithImpl<_UsersCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersCubitState&&(identical(other.usersStatus, usersStatus) || other.usersStatus == usersStatus)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.distanceStatus, distanceStatus) || other.distanceStatus == distanceStatus)&&(identical(other.batchStatus, batchStatus) || other.batchStatus == batchStatus)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.processingTimeMs, processingTimeMs) || other.processingTimeMs == processingTimeMs));
}


@override
int get hashCode => Object.hash(runtimeType,usersStatus,const DeepCollectionEquality().hash(_users),searchStatus,const DeepCollectionEquality().hash(_searchResults),searchQuery,distanceStatus,batchStatus,processingProgress,processingTimeMs);

@override
String toString() {
  return 'UsersCubitState(usersStatus: $usersStatus, users: $users, searchStatus: $searchStatus, searchResults: $searchResults, searchQuery: $searchQuery, distanceStatus: $distanceStatus, batchStatus: $batchStatus, processingProgress: $processingProgress, processingTimeMs: $processingTimeMs)';
}


}

/// @nodoc
abstract mixin class _$UsersCubitStateCopyWith<$Res> implements $UsersCubitStateCopyWith<$Res> {
  factory _$UsersCubitStateCopyWith(_UsersCubitState value, $Res Function(_UsersCubitState) _then) = __$UsersCubitStateCopyWithImpl;
@override @useResult
$Res call({
 VarStatus usersStatus, List<UserModel> users, VarStatus searchStatus, List<UserModel> searchResults, String searchQuery, VarStatus distanceStatus, VarStatus batchStatus, double processingProgress, int processingTimeMs
});




}
/// @nodoc
class __$UsersCubitStateCopyWithImpl<$Res>
    implements _$UsersCubitStateCopyWith<$Res> {
  __$UsersCubitStateCopyWithImpl(this._self, this._then);

  final _UsersCubitState _self;
  final $Res Function(_UsersCubitState) _then;

/// Create a copy of UsersCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usersStatus = null,Object? users = null,Object? searchStatus = null,Object? searchResults = null,Object? searchQuery = null,Object? distanceStatus = null,Object? batchStatus = null,Object? processingProgress = null,Object? processingTimeMs = null,}) {
  return _then(_UsersCubitState(
usersStatus: null == usersStatus ? _self.usersStatus : usersStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,distanceStatus: null == distanceStatus ? _self.distanceStatus : distanceStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,batchStatus: null == batchStatus ? _self.batchStatus : batchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as double,processingTimeMs: null == processingTimeMs ? _self.processingTimeMs : processingTimeMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
