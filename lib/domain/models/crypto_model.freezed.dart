// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CryptoModel {

// 🆔 Basic Information
 String? get id;// 'bitcoin', 'ethereum'
 String? get symbol;// 'BTC', 'ETH'
 String? get name;// 'Bitcoin', 'Ethereum'
 String? get image;// 🖼️ Coin logo URL
// 💰 Price Information
@JsonKey(name: 'current_price') double? get currentPrice;// Current price in USD
@JsonKey(name: 'market_cap') double? get marketCap;// Total market value
@JsonKey(name: 'market_cap_rank') int? get marketCapRank;// Ranking (1=Bitcoin, 2=Ethereum...)
// 📊 Price Changes (for beautiful green/red indicators)
@JsonKey(name: 'price_change_24h') double? get priceChange24h;// Price change in dollars
@JsonKey(name: 'price_change_percentage_24h') double? get priceChangePercentage24h;// Price change in percentage
// 📈 Trading Information
@JsonKey(name: 'total_volume') double? get totalVolume;// 24h trading volume
@JsonKey(name: 'high_24h') double? get high24h;// Highest price today
@JsonKey(name: 'low_24h') double? get low24h;// Lowest price today
// 💎 Additional Data
@JsonKey(name: 'circulating_supply') double? get circulatingSupply;// How many coins exist
@JsonKey(name: 'total_supply') double? get totalSupply;// Maximum possible coins
@JsonKey(name: 'max_supply') double? get maxSupply;// Hard limit of coins
@JsonKey(name: 'last_updated') String? get lastUpdated;
/// Create a copy of CryptoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CryptoModelCopyWith<CryptoModel> get copyWith => _$CryptoModelCopyWithImpl<CryptoModel>(this as CryptoModel, _$identity);

  /// Serializes this CryptoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CryptoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,currentPrice,marketCap,marketCapRank,priceChange24h,priceChangePercentage24h,totalVolume,high24h,low24h,circulatingSupply,totalSupply,maxSupply,lastUpdated);

@override
String toString() {
  return 'CryptoModel(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, priceChange24h: $priceChange24h, priceChangePercentage24h: $priceChangePercentage24h, totalVolume: $totalVolume, high24h: $high24h, low24h: $low24h, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $CryptoModelCopyWith<$Res>  {
  factory $CryptoModelCopyWith(CryptoModel value, $Res Function(CryptoModel) _then) = _$CryptoModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? symbol, String? name, String? image,@JsonKey(name: 'current_price') double? currentPrice,@JsonKey(name: 'market_cap') double? marketCap,@JsonKey(name: 'market_cap_rank') int? marketCapRank,@JsonKey(name: 'price_change_24h') double? priceChange24h,@JsonKey(name: 'price_change_percentage_24h') double? priceChangePercentage24h,@JsonKey(name: 'total_volume') double? totalVolume,@JsonKey(name: 'high_24h') double? high24h,@JsonKey(name: 'low_24h') double? low24h,@JsonKey(name: 'circulating_supply') double? circulatingSupply,@JsonKey(name: 'total_supply') double? totalSupply,@JsonKey(name: 'max_supply') double? maxSupply,@JsonKey(name: 'last_updated') String? lastUpdated
});




}
/// @nodoc
class _$CryptoModelCopyWithImpl<$Res>
    implements $CryptoModelCopyWith<$Res> {
  _$CryptoModelCopyWithImpl(this._self, this._then);

  final CryptoModel _self;
  final $Res Function(CryptoModel) _then;

/// Create a copy of CryptoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? symbol = freezed,Object? name = freezed,Object? image = freezed,Object? currentPrice = freezed,Object? marketCap = freezed,Object? marketCapRank = freezed,Object? priceChange24h = freezed,Object? priceChangePercentage24h = freezed,Object? totalVolume = freezed,Object? high24h = freezed,Object? low24h = freezed,Object? circulatingSupply = freezed,Object? totalSupply = freezed,Object? maxSupply = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage24h: freezed == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,totalVolume: freezed == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,circulatingSupply: freezed == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as double?,totalSupply: freezed == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as double?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as double?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CryptoModel].
extension CryptoModelPatterns on CryptoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CryptoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CryptoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CryptoModel value)  $default,){
final _that = this;
switch (_that) {
case _CryptoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CryptoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CryptoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? symbol,  String? name,  String? image, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'market_cap')  double? marketCap, @JsonKey(name: 'market_cap_rank')  int? marketCapRank, @JsonKey(name: 'price_change_24h')  double? priceChange24h, @JsonKey(name: 'price_change_percentage_24h')  double? priceChangePercentage24h, @JsonKey(name: 'total_volume')  double? totalVolume, @JsonKey(name: 'high_24h')  double? high24h, @JsonKey(name: 'low_24h')  double? low24h, @JsonKey(name: 'circulating_supply')  double? circulatingSupply, @JsonKey(name: 'total_supply')  double? totalSupply, @JsonKey(name: 'max_supply')  double? maxSupply, @JsonKey(name: 'last_updated')  String? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CryptoModel() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.priceChange24h,_that.priceChangePercentage24h,_that.totalVolume,_that.high24h,_that.low24h,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? symbol,  String? name,  String? image, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'market_cap')  double? marketCap, @JsonKey(name: 'market_cap_rank')  int? marketCapRank, @JsonKey(name: 'price_change_24h')  double? priceChange24h, @JsonKey(name: 'price_change_percentage_24h')  double? priceChangePercentage24h, @JsonKey(name: 'total_volume')  double? totalVolume, @JsonKey(name: 'high_24h')  double? high24h, @JsonKey(name: 'low_24h')  double? low24h, @JsonKey(name: 'circulating_supply')  double? circulatingSupply, @JsonKey(name: 'total_supply')  double? totalSupply, @JsonKey(name: 'max_supply')  double? maxSupply, @JsonKey(name: 'last_updated')  String? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _CryptoModel():
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.priceChange24h,_that.priceChangePercentage24h,_that.totalVolume,_that.high24h,_that.low24h,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? symbol,  String? name,  String? image, @JsonKey(name: 'current_price')  double? currentPrice, @JsonKey(name: 'market_cap')  double? marketCap, @JsonKey(name: 'market_cap_rank')  int? marketCapRank, @JsonKey(name: 'price_change_24h')  double? priceChange24h, @JsonKey(name: 'price_change_percentage_24h')  double? priceChangePercentage24h, @JsonKey(name: 'total_volume')  double? totalVolume, @JsonKey(name: 'high_24h')  double? high24h, @JsonKey(name: 'low_24h')  double? low24h, @JsonKey(name: 'circulating_supply')  double? circulatingSupply, @JsonKey(name: 'total_supply')  double? totalSupply, @JsonKey(name: 'max_supply')  double? maxSupply, @JsonKey(name: 'last_updated')  String? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _CryptoModel() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.priceChange24h,_that.priceChangePercentage24h,_that.totalVolume,_that.high24h,_that.low24h,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CryptoModel implements CryptoModel {
  const _CryptoModel({this.id, this.symbol, this.name, this.image, @JsonKey(name: 'current_price') this.currentPrice, @JsonKey(name: 'market_cap') this.marketCap, @JsonKey(name: 'market_cap_rank') this.marketCapRank, @JsonKey(name: 'price_change_24h') this.priceChange24h, @JsonKey(name: 'price_change_percentage_24h') this.priceChangePercentage24h, @JsonKey(name: 'total_volume') this.totalVolume, @JsonKey(name: 'high_24h') this.high24h, @JsonKey(name: 'low_24h') this.low24h, @JsonKey(name: 'circulating_supply') this.circulatingSupply, @JsonKey(name: 'total_supply') this.totalSupply, @JsonKey(name: 'max_supply') this.maxSupply, @JsonKey(name: 'last_updated') this.lastUpdated});
  factory _CryptoModel.fromJson(Map<String, dynamic> json) => _$CryptoModelFromJson(json);

// 🆔 Basic Information
@override final  String? id;
// 'bitcoin', 'ethereum'
@override final  String? symbol;
// 'BTC', 'ETH'
@override final  String? name;
// 'Bitcoin', 'Ethereum'
@override final  String? image;
// 🖼️ Coin logo URL
// 💰 Price Information
@override@JsonKey(name: 'current_price') final  double? currentPrice;
// Current price in USD
@override@JsonKey(name: 'market_cap') final  double? marketCap;
// Total market value
@override@JsonKey(name: 'market_cap_rank') final  int? marketCapRank;
// Ranking (1=Bitcoin, 2=Ethereum...)
// 📊 Price Changes (for beautiful green/red indicators)
@override@JsonKey(name: 'price_change_24h') final  double? priceChange24h;
// Price change in dollars
@override@JsonKey(name: 'price_change_percentage_24h') final  double? priceChangePercentage24h;
// Price change in percentage
// 📈 Trading Information
@override@JsonKey(name: 'total_volume') final  double? totalVolume;
// 24h trading volume
@override@JsonKey(name: 'high_24h') final  double? high24h;
// Highest price today
@override@JsonKey(name: 'low_24h') final  double? low24h;
// Lowest price today
// 💎 Additional Data
@override@JsonKey(name: 'circulating_supply') final  double? circulatingSupply;
// How many coins exist
@override@JsonKey(name: 'total_supply') final  double? totalSupply;
// Maximum possible coins
@override@JsonKey(name: 'max_supply') final  double? maxSupply;
// Hard limit of coins
@override@JsonKey(name: 'last_updated') final  String? lastUpdated;

/// Create a copy of CryptoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CryptoModelCopyWith<_CryptoModel> get copyWith => __$CryptoModelCopyWithImpl<_CryptoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CryptoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CryptoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,currentPrice,marketCap,marketCapRank,priceChange24h,priceChangePercentage24h,totalVolume,high24h,low24h,circulatingSupply,totalSupply,maxSupply,lastUpdated);

@override
String toString() {
  return 'CryptoModel(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, priceChange24h: $priceChange24h, priceChangePercentage24h: $priceChangePercentage24h, totalVolume: $totalVolume, high24h: $high24h, low24h: $low24h, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$CryptoModelCopyWith<$Res> implements $CryptoModelCopyWith<$Res> {
  factory _$CryptoModelCopyWith(_CryptoModel value, $Res Function(_CryptoModel) _then) = __$CryptoModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? symbol, String? name, String? image,@JsonKey(name: 'current_price') double? currentPrice,@JsonKey(name: 'market_cap') double? marketCap,@JsonKey(name: 'market_cap_rank') int? marketCapRank,@JsonKey(name: 'price_change_24h') double? priceChange24h,@JsonKey(name: 'price_change_percentage_24h') double? priceChangePercentage24h,@JsonKey(name: 'total_volume') double? totalVolume,@JsonKey(name: 'high_24h') double? high24h,@JsonKey(name: 'low_24h') double? low24h,@JsonKey(name: 'circulating_supply') double? circulatingSupply,@JsonKey(name: 'total_supply') double? totalSupply,@JsonKey(name: 'max_supply') double? maxSupply,@JsonKey(name: 'last_updated') String? lastUpdated
});




}
/// @nodoc
class __$CryptoModelCopyWithImpl<$Res>
    implements _$CryptoModelCopyWith<$Res> {
  __$CryptoModelCopyWithImpl(this._self, this._then);

  final _CryptoModel _self;
  final $Res Function(_CryptoModel) _then;

/// Create a copy of CryptoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? symbol = freezed,Object? name = freezed,Object? image = freezed,Object? currentPrice = freezed,Object? marketCap = freezed,Object? marketCapRank = freezed,Object? priceChange24h = freezed,Object? priceChangePercentage24h = freezed,Object? totalVolume = freezed,Object? high24h = freezed,Object? low24h = freezed,Object? circulatingSupply = freezed,Object? totalSupply = freezed,Object? maxSupply = freezed,Object? lastUpdated = freezed,}) {
  return _then(_CryptoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double?,marketCap: freezed == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage24h: freezed == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,totalVolume: freezed == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,circulatingSupply: freezed == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as double?,totalSupply: freezed == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as double?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as double?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
