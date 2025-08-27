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

/// Main users list status
 VarStatus get usersStatus; List<UserModel> get users;/// Search functionality status
 VarStatus get searchStatus; List<UserModel> get searchResults; String get searchQuery;/// Distance sorting status
 VarStatus get distanceStatus; List<UserModel> get sortedUsers;/// Batch processing status
 VarStatus get batchStatus; Map<String, List<UserModel>> get batchResults;/// Progress tracking for heavy operations
 double get processingProgress; bool get isProcessingCanceled;/// Performance metrics
 int get processingTimeMs; int get totalOperations; int get completedOperations;
/// Create a copy of UsersCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersCubitStateCopyWith<UsersCubitState> get copyWith => _$UsersCubitStateCopyWithImpl<UsersCubitState>(this as UsersCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersCubitState&&(identical(other.usersStatus, usersStatus) || other.usersStatus == usersStatus)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.distanceStatus, distanceStatus) || other.distanceStatus == distanceStatus)&&const DeepCollectionEquality().equals(other.sortedUsers, sortedUsers)&&(identical(other.batchStatus, batchStatus) || other.batchStatus == batchStatus)&&const DeepCollectionEquality().equals(other.batchResults, batchResults)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.isProcessingCanceled, isProcessingCanceled) || other.isProcessingCanceled == isProcessingCanceled)&&(identical(other.processingTimeMs, processingTimeMs) || other.processingTimeMs == processingTimeMs)&&(identical(other.totalOperations, totalOperations) || other.totalOperations == totalOperations)&&(identical(other.completedOperations, completedOperations) || other.completedOperations == completedOperations));
}


@override
int get hashCode => Object.hash(runtimeType,usersStatus,const DeepCollectionEquality().hash(users),searchStatus,const DeepCollectionEquality().hash(searchResults),searchQuery,distanceStatus,const DeepCollectionEquality().hash(sortedUsers),batchStatus,const DeepCollectionEquality().hash(batchResults),processingProgress,isProcessingCanceled,processingTimeMs,totalOperations,completedOperations);

@override
String toString() {
  return 'UsersCubitState(usersStatus: $usersStatus, users: $users, searchStatus: $searchStatus, searchResults: $searchResults, searchQuery: $searchQuery, distanceStatus: $distanceStatus, sortedUsers: $sortedUsers, batchStatus: $batchStatus, batchResults: $batchResults, processingProgress: $processingProgress, isProcessingCanceled: $isProcessingCanceled, processingTimeMs: $processingTimeMs, totalOperations: $totalOperations, completedOperations: $completedOperations)';
}


}

/// @nodoc
abstract mixin class $UsersCubitStateCopyWith<$Res>  {
  factory $UsersCubitStateCopyWith(UsersCubitState value, $Res Function(UsersCubitState) _then) = _$UsersCubitStateCopyWithImpl;
@useResult
$Res call({
 VarStatus usersStatus, List<UserModel> users, VarStatus searchStatus, List<UserModel> searchResults, String searchQuery, VarStatus distanceStatus, List<UserModel> sortedUsers, VarStatus batchStatus, Map<String, List<UserModel>> batchResults, double processingProgress, bool isProcessingCanceled, int processingTimeMs, int totalOperations, int completedOperations
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
@pragma('vm:prefer-inline') @override $Res call({Object? usersStatus = null,Object? users = null,Object? searchStatus = null,Object? searchResults = null,Object? searchQuery = null,Object? distanceStatus = null,Object? sortedUsers = null,Object? batchStatus = null,Object? batchResults = null,Object? processingProgress = null,Object? isProcessingCanceled = null,Object? processingTimeMs = null,Object? totalOperations = null,Object? completedOperations = null,}) {
  return _then(_self.copyWith(
usersStatus: null == usersStatus ? _self.usersStatus : usersStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,distanceStatus: null == distanceStatus ? _self.distanceStatus : distanceStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,sortedUsers: null == sortedUsers ? _self.sortedUsers : sortedUsers // ignore: cast_nullable_to_non_nullable
as List<UserModel>,batchStatus: null == batchStatus ? _self.batchStatus : batchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,batchResults: null == batchResults ? _self.batchResults : batchResults // ignore: cast_nullable_to_non_nullable
as Map<String, List<UserModel>>,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as double,isProcessingCanceled: null == isProcessingCanceled ? _self.isProcessingCanceled : isProcessingCanceled // ignore: cast_nullable_to_non_nullable
as bool,processingTimeMs: null == processingTimeMs ? _self.processingTimeMs : processingTimeMs // ignore: cast_nullable_to_non_nullable
as int,totalOperations: null == totalOperations ? _self.totalOperations : totalOperations // ignore: cast_nullable_to_non_nullable
as int,completedOperations: null == completedOperations ? _self.completedOperations : completedOperations // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VarStatus usersStatus,  List<UserModel> users,  VarStatus searchStatus,  List<UserModel> searchResults,  String searchQuery,  VarStatus distanceStatus,  List<UserModel> sortedUsers,  VarStatus batchStatus,  Map<String, List<UserModel>> batchResults,  double processingProgress,  bool isProcessingCanceled,  int processingTimeMs,  int totalOperations,  int completedOperations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersCubitState() when $default != null:
return $default(_that.usersStatus,_that.users,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.distanceStatus,_that.sortedUsers,_that.batchStatus,_that.batchResults,_that.processingProgress,_that.isProcessingCanceled,_that.processingTimeMs,_that.totalOperations,_that.completedOperations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VarStatus usersStatus,  List<UserModel> users,  VarStatus searchStatus,  List<UserModel> searchResults,  String searchQuery,  VarStatus distanceStatus,  List<UserModel> sortedUsers,  VarStatus batchStatus,  Map<String, List<UserModel>> batchResults,  double processingProgress,  bool isProcessingCanceled,  int processingTimeMs,  int totalOperations,  int completedOperations)  $default,) {final _that = this;
switch (_that) {
case _UsersCubitState():
return $default(_that.usersStatus,_that.users,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.distanceStatus,_that.sortedUsers,_that.batchStatus,_that.batchResults,_that.processingProgress,_that.isProcessingCanceled,_that.processingTimeMs,_that.totalOperations,_that.completedOperations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VarStatus usersStatus,  List<UserModel> users,  VarStatus searchStatus,  List<UserModel> searchResults,  String searchQuery,  VarStatus distanceStatus,  List<UserModel> sortedUsers,  VarStatus batchStatus,  Map<String, List<UserModel>> batchResults,  double processingProgress,  bool isProcessingCanceled,  int processingTimeMs,  int totalOperations,  int completedOperations)?  $default,) {final _that = this;
switch (_that) {
case _UsersCubitState() when $default != null:
return $default(_that.usersStatus,_that.users,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.distanceStatus,_that.sortedUsers,_that.batchStatus,_that.batchResults,_that.processingProgress,_that.isProcessingCanceled,_that.processingTimeMs,_that.totalOperations,_that.completedOperations);case _:
  return null;

}
}

}

/// @nodoc


class _UsersCubitState implements UsersCubitState {
  const _UsersCubitState({this.usersStatus = const VarStatus(), final  List<UserModel> users = const [], this.searchStatus = const VarStatus(), final  List<UserModel> searchResults = const [], this.searchQuery = '', this.distanceStatus = const VarStatus(), final  List<UserModel> sortedUsers = const [], this.batchStatus = const VarStatus(), final  Map<String, List<UserModel>> batchResults = const {}, this.processingProgress = 0.0, this.isProcessingCanceled = false, this.processingTimeMs = 0, this.totalOperations = 0, this.completedOperations = 0}): _users = users,_searchResults = searchResults,_sortedUsers = sortedUsers,_batchResults = batchResults;
  

/// Main users list status
@override@JsonKey() final  VarStatus usersStatus;
 final  List<UserModel> _users;
@override@JsonKey() List<UserModel> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

/// Search functionality status
@override@JsonKey() final  VarStatus searchStatus;
 final  List<UserModel> _searchResults;
@override@JsonKey() List<UserModel> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override@JsonKey() final  String searchQuery;
/// Distance sorting status
@override@JsonKey() final  VarStatus distanceStatus;
 final  List<UserModel> _sortedUsers;
@override@JsonKey() List<UserModel> get sortedUsers {
  if (_sortedUsers is EqualUnmodifiableListView) return _sortedUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sortedUsers);
}

/// Batch processing status
@override@JsonKey() final  VarStatus batchStatus;
 final  Map<String, List<UserModel>> _batchResults;
@override@JsonKey() Map<String, List<UserModel>> get batchResults {
  if (_batchResults is EqualUnmodifiableMapView) return _batchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_batchResults);
}

/// Progress tracking for heavy operations
@override@JsonKey() final  double processingProgress;
@override@JsonKey() final  bool isProcessingCanceled;
/// Performance metrics
@override@JsonKey() final  int processingTimeMs;
@override@JsonKey() final  int totalOperations;
@override@JsonKey() final  int completedOperations;

/// Create a copy of UsersCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersCubitStateCopyWith<_UsersCubitState> get copyWith => __$UsersCubitStateCopyWithImpl<_UsersCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersCubitState&&(identical(other.usersStatus, usersStatus) || other.usersStatus == usersStatus)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.distanceStatus, distanceStatus) || other.distanceStatus == distanceStatus)&&const DeepCollectionEquality().equals(other._sortedUsers, _sortedUsers)&&(identical(other.batchStatus, batchStatus) || other.batchStatus == batchStatus)&&const DeepCollectionEquality().equals(other._batchResults, _batchResults)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.isProcessingCanceled, isProcessingCanceled) || other.isProcessingCanceled == isProcessingCanceled)&&(identical(other.processingTimeMs, processingTimeMs) || other.processingTimeMs == processingTimeMs)&&(identical(other.totalOperations, totalOperations) || other.totalOperations == totalOperations)&&(identical(other.completedOperations, completedOperations) || other.completedOperations == completedOperations));
}


@override
int get hashCode => Object.hash(runtimeType,usersStatus,const DeepCollectionEquality().hash(_users),searchStatus,const DeepCollectionEquality().hash(_searchResults),searchQuery,distanceStatus,const DeepCollectionEquality().hash(_sortedUsers),batchStatus,const DeepCollectionEquality().hash(_batchResults),processingProgress,isProcessingCanceled,processingTimeMs,totalOperations,completedOperations);

@override
String toString() {
  return 'UsersCubitState(usersStatus: $usersStatus, users: $users, searchStatus: $searchStatus, searchResults: $searchResults, searchQuery: $searchQuery, distanceStatus: $distanceStatus, sortedUsers: $sortedUsers, batchStatus: $batchStatus, batchResults: $batchResults, processingProgress: $processingProgress, isProcessingCanceled: $isProcessingCanceled, processingTimeMs: $processingTimeMs, totalOperations: $totalOperations, completedOperations: $completedOperations)';
}


}

/// @nodoc
abstract mixin class _$UsersCubitStateCopyWith<$Res> implements $UsersCubitStateCopyWith<$Res> {
  factory _$UsersCubitStateCopyWith(_UsersCubitState value, $Res Function(_UsersCubitState) _then) = __$UsersCubitStateCopyWithImpl;
@override @useResult
$Res call({
 VarStatus usersStatus, List<UserModel> users, VarStatus searchStatus, List<UserModel> searchResults, String searchQuery, VarStatus distanceStatus, List<UserModel> sortedUsers, VarStatus batchStatus, Map<String, List<UserModel>> batchResults, double processingProgress, bool isProcessingCanceled, int processingTimeMs, int totalOperations, int completedOperations
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
@override @pragma('vm:prefer-inline') $Res call({Object? usersStatus = null,Object? users = null,Object? searchStatus = null,Object? searchResults = null,Object? searchQuery = null,Object? distanceStatus = null,Object? sortedUsers = null,Object? batchStatus = null,Object? batchResults = null,Object? processingProgress = null,Object? isProcessingCanceled = null,Object? processingTimeMs = null,Object? totalOperations = null,Object? completedOperations = null,}) {
  return _then(_UsersCubitState(
usersStatus: null == usersStatus ? _self.usersStatus : usersStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<UserModel>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,distanceStatus: null == distanceStatus ? _self.distanceStatus : distanceStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,sortedUsers: null == sortedUsers ? _self._sortedUsers : sortedUsers // ignore: cast_nullable_to_non_nullable
as List<UserModel>,batchStatus: null == batchStatus ? _self.batchStatus : batchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,batchResults: null == batchResults ? _self._batchResults : batchResults // ignore: cast_nullable_to_non_nullable
as Map<String, List<UserModel>>,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as double,isProcessingCanceled: null == isProcessingCanceled ? _self.isProcessingCanceled : isProcessingCanceled // ignore: cast_nullable_to_non_nullable
as bool,processingTimeMs: null == processingTimeMs ? _self.processingTimeMs : processingTimeMs // ignore: cast_nullable_to_non_nullable
as int,totalOperations: null == totalOperations ? _self.totalOperations : totalOperations // ignore: cast_nullable_to_non_nullable
as int,completedOperations: null == completedOperations ? _self.completedOperations : completedOperations // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
