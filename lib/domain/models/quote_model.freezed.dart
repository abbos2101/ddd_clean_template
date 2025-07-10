// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuoteModel {

 int get id; String get quote; String get author;
/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteModelCopyWith<QuoteModel> get copyWith => _$QuoteModelCopyWithImpl<QuoteModel>(this as QuoteModel, _$identity);

  /// Serializes this QuoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.author, author) || other.author == author));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quote,author);

@override
String toString() {
  return 'QuoteModel(id: $id, quote: $quote, author: $author)';
}


}

/// @nodoc
abstract mixin class $QuoteModelCopyWith<$Res>  {
  factory $QuoteModelCopyWith(QuoteModel value, $Res Function(QuoteModel) _then) = _$QuoteModelCopyWithImpl;
@useResult
$Res call({
 int id, String quote, String author
});




}
/// @nodoc
class _$QuoteModelCopyWithImpl<$Res>
    implements $QuoteModelCopyWith<$Res> {
  _$QuoteModelCopyWithImpl(this._self, this._then);

  final QuoteModel _self;
  final $Res Function(QuoteModel) _then;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quote = null,Object? author = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteModel].
extension QuoteModelPatterns on QuoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteModel value)  $default,){
final _that = this;
switch (_that) {
case _QuoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String quote,  String author)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
return $default(_that.id,_that.quote,_that.author);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String quote,  String author)  $default,) {final _that = this;
switch (_that) {
case _QuoteModel():
return $default(_that.id,_that.quote,_that.author);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String quote,  String author)?  $default,) {final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
return $default(_that.id,_that.quote,_that.author);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteModel implements QuoteModel {
  const _QuoteModel({this.id = 0, this.quote = '', this.author = ''});
  factory _QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String quote;
@override@JsonKey() final  String author;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteModelCopyWith<_QuoteModel> get copyWith => __$QuoteModelCopyWithImpl<_QuoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.author, author) || other.author == author));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quote,author);

@override
String toString() {
  return 'QuoteModel(id: $id, quote: $quote, author: $author)';
}


}

/// @nodoc
abstract mixin class _$QuoteModelCopyWith<$Res> implements $QuoteModelCopyWith<$Res> {
  factory _$QuoteModelCopyWith(_QuoteModel value, $Res Function(_QuoteModel) _then) = __$QuoteModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String quote, String author
});




}
/// @nodoc
class __$QuoteModelCopyWithImpl<$Res>
    implements _$QuoteModelCopyWith<$Res> {
  __$QuoteModelCopyWithImpl(this._self, this._then);

  final _QuoteModel _self;
  final $Res Function(_QuoteModel) _then;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? quote = null,Object? author = null,}) {
  return _then(_QuoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
