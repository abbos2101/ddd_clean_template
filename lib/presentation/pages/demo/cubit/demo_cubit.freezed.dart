// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DemoState {

 int get skip; dynamic get enableNext; VarStatus get quotesStatus; List<QuoteModel> get quotes;
/// Create a copy of DemoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DemoStateCopyWith<DemoState> get copyWith => _$DemoStateCopyWithImpl<DemoState>(this as DemoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DemoState&&(identical(other.skip, skip) || other.skip == skip)&&const DeepCollectionEquality().equals(other.enableNext, enableNext)&&(identical(other.quotesStatus, quotesStatus) || other.quotesStatus == quotesStatus)&&const DeepCollectionEquality().equals(other.quotes, quotes));
}


@override
int get hashCode => Object.hash(runtimeType,skip,const DeepCollectionEquality().hash(enableNext),quotesStatus,const DeepCollectionEquality().hash(quotes));

@override
String toString() {
  return 'DemoState(skip: $skip, enableNext: $enableNext, quotesStatus: $quotesStatus, quotes: $quotes)';
}


}

/// @nodoc
abstract mixin class $DemoStateCopyWith<$Res>  {
  factory $DemoStateCopyWith(DemoState value, $Res Function(DemoState) _then) = _$DemoStateCopyWithImpl;
@useResult
$Res call({
 int skip, dynamic enableNext, VarStatus quotesStatus, List<QuoteModel> quotes
});




}
/// @nodoc
class _$DemoStateCopyWithImpl<$Res>
    implements $DemoStateCopyWith<$Res> {
  _$DemoStateCopyWithImpl(this._self, this._then);

  final DemoState _self;
  final $Res Function(DemoState) _then;

/// Create a copy of DemoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skip = null,Object? enableNext = freezed,Object? quotesStatus = null,Object? quotes = null,}) {
  return _then(_self.copyWith(
skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,enableNext: freezed == enableNext ? _self.enableNext : enableNext // ignore: cast_nullable_to_non_nullable
as dynamic,quotesStatus: null == quotesStatus ? _self.quotesStatus : quotesStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,quotes: null == quotes ? _self.quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<QuoteModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DemoState].
extension DemoStatePatterns on DemoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int skip,  dynamic enableNext,  VarStatus quotesStatus,  List<QuoteModel> quotes)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.skip,_that.enableNext,_that.quotesStatus,_that.quotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int skip,  dynamic enableNext,  VarStatus quotesStatus,  List<QuoteModel> quotes)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.skip,_that.enableNext,_that.quotesStatus,_that.quotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int skip,  dynamic enableNext,  VarStatus quotesStatus,  List<QuoteModel> quotes)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.skip,_that.enableNext,_that.quotesStatus,_that.quotes);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DemoState {
  const _Initial({this.skip = 0, this.enableNext = true, this.quotesStatus = const VarStatus(), final  List<QuoteModel> quotes = const []}): _quotes = quotes;
  

@override@JsonKey() final  int skip;
@override@JsonKey() final  dynamic enableNext;
@override@JsonKey() final  VarStatus quotesStatus;
 final  List<QuoteModel> _quotes;
@override@JsonKey() List<QuoteModel> get quotes {
  if (_quotes is EqualUnmodifiableListView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotes);
}


/// Create a copy of DemoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.skip, skip) || other.skip == skip)&&const DeepCollectionEquality().equals(other.enableNext, enableNext)&&(identical(other.quotesStatus, quotesStatus) || other.quotesStatus == quotesStatus)&&const DeepCollectionEquality().equals(other._quotes, _quotes));
}


@override
int get hashCode => Object.hash(runtimeType,skip,const DeepCollectionEquality().hash(enableNext),quotesStatus,const DeepCollectionEquality().hash(_quotes));

@override
String toString() {
  return 'DemoState.initial(skip: $skip, enableNext: $enableNext, quotesStatus: $quotesStatus, quotes: $quotes)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $DemoStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 int skip, dynamic enableNext, VarStatus quotesStatus, List<QuoteModel> quotes
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of DemoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? skip = null,Object? enableNext = freezed,Object? quotesStatus = null,Object? quotes = null,}) {
  return _then(_Initial(
skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,enableNext: freezed == enableNext ? _self.enableNext : enableNext // ignore: cast_nullable_to_non_nullable
as dynamic,quotesStatus: null == quotesStatus ? _self.quotesStatus : quotesStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<QuoteModel>,
  ));
}


}

// dart format on
