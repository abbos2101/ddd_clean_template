// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CryptoCubitState {

// 🏆 Top Cryptocurrencies Dashboard
 VarStatus get topCryptosStatus;// 🚦 Loading status
 List<CryptoModel> get topCryptocurrencies;// 💰 Top 20 coins
// 🔍 Search Functionality
 VarStatus get searchStatus;// 🚦 Search loading
 List<CryptoModel> get searchResults;// 🔍 Search results
 String get searchQuery;// 📝 Current search
// ⭐ Favorites System
 List<CryptoModel> get favoriteCryptocurrencies;// ❤️ User favorites
 int get favoritesCount;// 📊 Count of favorites
// 📊 UI Enhancement Data
 double get loadingProgress;// 📈 Loading progress %
 int get processingTimeMs;// ⏱️ How fast was API call
 DateTime? get lastUpdated;// 🕐 When data was updated
// 🎨 Additional UX Features
 bool get isRefreshing;// 🔄 Pull-to-refresh status
 String? get selectedCryptoId;
/// Create a copy of CryptoCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CryptoCubitStateCopyWith<CryptoCubitState> get copyWith => _$CryptoCubitStateCopyWithImpl<CryptoCubitState>(this as CryptoCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CryptoCubitState&&(identical(other.topCryptosStatus, topCryptosStatus) || other.topCryptosStatus == topCryptosStatus)&&const DeepCollectionEquality().equals(other.topCryptocurrencies, topCryptocurrencies)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.favoriteCryptocurrencies, favoriteCryptocurrencies)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress)&&(identical(other.processingTimeMs, processingTimeMs) || other.processingTimeMs == processingTimeMs)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.selectedCryptoId, selectedCryptoId) || other.selectedCryptoId == selectedCryptoId));
}


@override
int get hashCode => Object.hash(runtimeType,topCryptosStatus,const DeepCollectionEquality().hash(topCryptocurrencies),searchStatus,const DeepCollectionEquality().hash(searchResults),searchQuery,const DeepCollectionEquality().hash(favoriteCryptocurrencies),favoritesCount,loadingProgress,processingTimeMs,lastUpdated,isRefreshing,selectedCryptoId);

@override
String toString() {
  return 'CryptoCubitState(topCryptosStatus: $topCryptosStatus, topCryptocurrencies: $topCryptocurrencies, searchStatus: $searchStatus, searchResults: $searchResults, searchQuery: $searchQuery, favoriteCryptocurrencies: $favoriteCryptocurrencies, favoritesCount: $favoritesCount, loadingProgress: $loadingProgress, processingTimeMs: $processingTimeMs, lastUpdated: $lastUpdated, isRefreshing: $isRefreshing, selectedCryptoId: $selectedCryptoId)';
}


}

/// @nodoc
abstract mixin class $CryptoCubitStateCopyWith<$Res>  {
  factory $CryptoCubitStateCopyWith(CryptoCubitState value, $Res Function(CryptoCubitState) _then) = _$CryptoCubitStateCopyWithImpl;
@useResult
$Res call({
 VarStatus topCryptosStatus, List<CryptoModel> topCryptocurrencies, VarStatus searchStatus, List<CryptoModel> searchResults, String searchQuery, List<CryptoModel> favoriteCryptocurrencies, int favoritesCount, double loadingProgress, int processingTimeMs, DateTime? lastUpdated, bool isRefreshing, String? selectedCryptoId
});




}
/// @nodoc
class _$CryptoCubitStateCopyWithImpl<$Res>
    implements $CryptoCubitStateCopyWith<$Res> {
  _$CryptoCubitStateCopyWithImpl(this._self, this._then);

  final CryptoCubitState _self;
  final $Res Function(CryptoCubitState) _then;

/// Create a copy of CryptoCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topCryptosStatus = null,Object? topCryptocurrencies = null,Object? searchStatus = null,Object? searchResults = null,Object? searchQuery = null,Object? favoriteCryptocurrencies = null,Object? favoritesCount = null,Object? loadingProgress = null,Object? processingTimeMs = null,Object? lastUpdated = freezed,Object? isRefreshing = null,Object? selectedCryptoId = freezed,}) {
  return _then(_self.copyWith(
topCryptosStatus: null == topCryptosStatus ? _self.topCryptosStatus : topCryptosStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,topCryptocurrencies: null == topCryptocurrencies ? _self.topCryptocurrencies : topCryptocurrencies // ignore: cast_nullable_to_non_nullable
as List<CryptoModel>,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<CryptoModel>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,favoriteCryptocurrencies: null == favoriteCryptocurrencies ? _self.favoriteCryptocurrencies : favoriteCryptocurrencies // ignore: cast_nullable_to_non_nullable
as List<CryptoModel>,favoritesCount: null == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int,loadingProgress: null == loadingProgress ? _self.loadingProgress : loadingProgress // ignore: cast_nullable_to_non_nullable
as double,processingTimeMs: null == processingTimeMs ? _self.processingTimeMs : processingTimeMs // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,selectedCryptoId: freezed == selectedCryptoId ? _self.selectedCryptoId : selectedCryptoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CryptoCubitState].
extension CryptoCubitStatePatterns on CryptoCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CryptoCubitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CryptoCubitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CryptoCubitState value)  $default,){
final _that = this;
switch (_that) {
case _CryptoCubitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CryptoCubitState value)?  $default,){
final _that = this;
switch (_that) {
case _CryptoCubitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VarStatus topCryptosStatus,  List<CryptoModel> topCryptocurrencies,  VarStatus searchStatus,  List<CryptoModel> searchResults,  String searchQuery,  List<CryptoModel> favoriteCryptocurrencies,  int favoritesCount,  double loadingProgress,  int processingTimeMs,  DateTime? lastUpdated,  bool isRefreshing,  String? selectedCryptoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CryptoCubitState() when $default != null:
return $default(_that.topCryptosStatus,_that.topCryptocurrencies,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.favoriteCryptocurrencies,_that.favoritesCount,_that.loadingProgress,_that.processingTimeMs,_that.lastUpdated,_that.isRefreshing,_that.selectedCryptoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VarStatus topCryptosStatus,  List<CryptoModel> topCryptocurrencies,  VarStatus searchStatus,  List<CryptoModel> searchResults,  String searchQuery,  List<CryptoModel> favoriteCryptocurrencies,  int favoritesCount,  double loadingProgress,  int processingTimeMs,  DateTime? lastUpdated,  bool isRefreshing,  String? selectedCryptoId)  $default,) {final _that = this;
switch (_that) {
case _CryptoCubitState():
return $default(_that.topCryptosStatus,_that.topCryptocurrencies,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.favoriteCryptocurrencies,_that.favoritesCount,_that.loadingProgress,_that.processingTimeMs,_that.lastUpdated,_that.isRefreshing,_that.selectedCryptoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VarStatus topCryptosStatus,  List<CryptoModel> topCryptocurrencies,  VarStatus searchStatus,  List<CryptoModel> searchResults,  String searchQuery,  List<CryptoModel> favoriteCryptocurrencies,  int favoritesCount,  double loadingProgress,  int processingTimeMs,  DateTime? lastUpdated,  bool isRefreshing,  String? selectedCryptoId)?  $default,) {final _that = this;
switch (_that) {
case _CryptoCubitState() when $default != null:
return $default(_that.topCryptosStatus,_that.topCryptocurrencies,_that.searchStatus,_that.searchResults,_that.searchQuery,_that.favoriteCryptocurrencies,_that.favoritesCount,_that.loadingProgress,_that.processingTimeMs,_that.lastUpdated,_that.isRefreshing,_that.selectedCryptoId);case _:
  return null;

}
}

}

/// @nodoc


class _CryptoCubitState implements CryptoCubitState {
  const _CryptoCubitState({this.topCryptosStatus = const VarStatus(), final  List<CryptoModel> topCryptocurrencies = const [], this.searchStatus = const VarStatus(), final  List<CryptoModel> searchResults = const [], this.searchQuery = '', final  List<CryptoModel> favoriteCryptocurrencies = const [], this.favoritesCount = 0, this.loadingProgress = 0.0, this.processingTimeMs = 0, this.lastUpdated, this.isRefreshing = false, this.selectedCryptoId}): _topCryptocurrencies = topCryptocurrencies,_searchResults = searchResults,_favoriteCryptocurrencies = favoriteCryptocurrencies;
  

// 🏆 Top Cryptocurrencies Dashboard
@override@JsonKey() final  VarStatus topCryptosStatus;
// 🚦 Loading status
 final  List<CryptoModel> _topCryptocurrencies;
// 🚦 Loading status
@override@JsonKey() List<CryptoModel> get topCryptocurrencies {
  if (_topCryptocurrencies is EqualUnmodifiableListView) return _topCryptocurrencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topCryptocurrencies);
}

// 💰 Top 20 coins
// 🔍 Search Functionality
@override@JsonKey() final  VarStatus searchStatus;
// 🚦 Search loading
 final  List<CryptoModel> _searchResults;
// 🚦 Search loading
@override@JsonKey() List<CryptoModel> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

// 🔍 Search results
@override@JsonKey() final  String searchQuery;
// 📝 Current search
// ⭐ Favorites System
 final  List<CryptoModel> _favoriteCryptocurrencies;
// 📝 Current search
// ⭐ Favorites System
@override@JsonKey() List<CryptoModel> get favoriteCryptocurrencies {
  if (_favoriteCryptocurrencies is EqualUnmodifiableListView) return _favoriteCryptocurrencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteCryptocurrencies);
}

// ❤️ User favorites
@override@JsonKey() final  int favoritesCount;
// 📊 Count of favorites
// 📊 UI Enhancement Data
@override@JsonKey() final  double loadingProgress;
// 📈 Loading progress %
@override@JsonKey() final  int processingTimeMs;
// ⏱️ How fast was API call
@override final  DateTime? lastUpdated;
// 🕐 When data was updated
// 🎨 Additional UX Features
@override@JsonKey() final  bool isRefreshing;
// 🔄 Pull-to-refresh status
@override final  String? selectedCryptoId;

/// Create a copy of CryptoCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CryptoCubitStateCopyWith<_CryptoCubitState> get copyWith => __$CryptoCubitStateCopyWithImpl<_CryptoCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CryptoCubitState&&(identical(other.topCryptosStatus, topCryptosStatus) || other.topCryptosStatus == topCryptosStatus)&&const DeepCollectionEquality().equals(other._topCryptocurrencies, _topCryptocurrencies)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._favoriteCryptocurrencies, _favoriteCryptocurrencies)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress)&&(identical(other.processingTimeMs, processingTimeMs) || other.processingTimeMs == processingTimeMs)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.selectedCryptoId, selectedCryptoId) || other.selectedCryptoId == selectedCryptoId));
}


@override
int get hashCode => Object.hash(runtimeType,topCryptosStatus,const DeepCollectionEquality().hash(_topCryptocurrencies),searchStatus,const DeepCollectionEquality().hash(_searchResults),searchQuery,const DeepCollectionEquality().hash(_favoriteCryptocurrencies),favoritesCount,loadingProgress,processingTimeMs,lastUpdated,isRefreshing,selectedCryptoId);

@override
String toString() {
  return 'CryptoCubitState(topCryptosStatus: $topCryptosStatus, topCryptocurrencies: $topCryptocurrencies, searchStatus: $searchStatus, searchResults: $searchResults, searchQuery: $searchQuery, favoriteCryptocurrencies: $favoriteCryptocurrencies, favoritesCount: $favoritesCount, loadingProgress: $loadingProgress, processingTimeMs: $processingTimeMs, lastUpdated: $lastUpdated, isRefreshing: $isRefreshing, selectedCryptoId: $selectedCryptoId)';
}


}

/// @nodoc
abstract mixin class _$CryptoCubitStateCopyWith<$Res> implements $CryptoCubitStateCopyWith<$Res> {
  factory _$CryptoCubitStateCopyWith(_CryptoCubitState value, $Res Function(_CryptoCubitState) _then) = __$CryptoCubitStateCopyWithImpl;
@override @useResult
$Res call({
 VarStatus topCryptosStatus, List<CryptoModel> topCryptocurrencies, VarStatus searchStatus, List<CryptoModel> searchResults, String searchQuery, List<CryptoModel> favoriteCryptocurrencies, int favoritesCount, double loadingProgress, int processingTimeMs, DateTime? lastUpdated, bool isRefreshing, String? selectedCryptoId
});




}
/// @nodoc
class __$CryptoCubitStateCopyWithImpl<$Res>
    implements _$CryptoCubitStateCopyWith<$Res> {
  __$CryptoCubitStateCopyWithImpl(this._self, this._then);

  final _CryptoCubitState _self;
  final $Res Function(_CryptoCubitState) _then;

/// Create a copy of CryptoCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topCryptosStatus = null,Object? topCryptocurrencies = null,Object? searchStatus = null,Object? searchResults = null,Object? searchQuery = null,Object? favoriteCryptocurrencies = null,Object? favoritesCount = null,Object? loadingProgress = null,Object? processingTimeMs = null,Object? lastUpdated = freezed,Object? isRefreshing = null,Object? selectedCryptoId = freezed,}) {
  return _then(_CryptoCubitState(
topCryptosStatus: null == topCryptosStatus ? _self.topCryptosStatus : topCryptosStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,topCryptocurrencies: null == topCryptocurrencies ? _self._topCryptocurrencies : topCryptocurrencies // ignore: cast_nullable_to_non_nullable
as List<CryptoModel>,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<CryptoModel>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,favoriteCryptocurrencies: null == favoriteCryptocurrencies ? _self._favoriteCryptocurrencies : favoriteCryptocurrencies // ignore: cast_nullable_to_non_nullable
as List<CryptoModel>,favoritesCount: null == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int,loadingProgress: null == loadingProgress ? _self.loadingProgress : loadingProgress // ignore: cast_nullable_to_non_nullable
as double,processingTimeMs: null == processingTimeMs ? _self.processingTimeMs : processingTimeMs // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,selectedCryptoId: freezed == selectedCryptoId ? _self.selectedCryptoId : selectedCryptoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
