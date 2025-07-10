// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceInfoState {

/// checkNotJailBroken
 VarStatus get checkNotJailBrokenStatus;/// checkRealDevice
 VarStatus get checkRealDeviceStatus;/// checkRealLocation
 VarStatus get checkRealLocationStatus;/// projectInfo
 VarStatus get projectInfoStatus; PackageInfo get projectInfo;
/// Create a copy of DeviceInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceInfoStateCopyWith<DeviceInfoState> get copyWith => _$DeviceInfoStateCopyWithImpl<DeviceInfoState>(this as DeviceInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceInfoState&&(identical(other.checkNotJailBrokenStatus, checkNotJailBrokenStatus) || other.checkNotJailBrokenStatus == checkNotJailBrokenStatus)&&(identical(other.checkRealDeviceStatus, checkRealDeviceStatus) || other.checkRealDeviceStatus == checkRealDeviceStatus)&&(identical(other.checkRealLocationStatus, checkRealLocationStatus) || other.checkRealLocationStatus == checkRealLocationStatus)&&(identical(other.projectInfoStatus, projectInfoStatus) || other.projectInfoStatus == projectInfoStatus)&&(identical(other.projectInfo, projectInfo) || other.projectInfo == projectInfo));
}


@override
int get hashCode => Object.hash(runtimeType,checkNotJailBrokenStatus,checkRealDeviceStatus,checkRealLocationStatus,projectInfoStatus,projectInfo);

@override
String toString() {
  return 'DeviceInfoState(checkNotJailBrokenStatus: $checkNotJailBrokenStatus, checkRealDeviceStatus: $checkRealDeviceStatus, checkRealLocationStatus: $checkRealLocationStatus, projectInfoStatus: $projectInfoStatus, projectInfo: $projectInfo)';
}


}

/// @nodoc
abstract mixin class $DeviceInfoStateCopyWith<$Res>  {
  factory $DeviceInfoStateCopyWith(DeviceInfoState value, $Res Function(DeviceInfoState) _then) = _$DeviceInfoStateCopyWithImpl;
@useResult
$Res call({
 VarStatus checkNotJailBrokenStatus, VarStatus checkRealDeviceStatus, VarStatus checkRealLocationStatus, VarStatus projectInfoStatus, PackageInfo projectInfo
});




}
/// @nodoc
class _$DeviceInfoStateCopyWithImpl<$Res>
    implements $DeviceInfoStateCopyWith<$Res> {
  _$DeviceInfoStateCopyWithImpl(this._self, this._then);

  final DeviceInfoState _self;
  final $Res Function(DeviceInfoState) _then;

/// Create a copy of DeviceInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkNotJailBrokenStatus = null,Object? checkRealDeviceStatus = null,Object? checkRealLocationStatus = null,Object? projectInfoStatus = null,Object? projectInfo = null,}) {
  return _then(_self.copyWith(
checkNotJailBrokenStatus: null == checkNotJailBrokenStatus ? _self.checkNotJailBrokenStatus : checkNotJailBrokenStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,checkRealDeviceStatus: null == checkRealDeviceStatus ? _self.checkRealDeviceStatus : checkRealDeviceStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,checkRealLocationStatus: null == checkRealLocationStatus ? _self.checkRealLocationStatus : checkRealLocationStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,projectInfoStatus: null == projectInfoStatus ? _self.projectInfoStatus : projectInfoStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,projectInfo: null == projectInfo ? _self.projectInfo : projectInfo // ignore: cast_nullable_to_non_nullable
as PackageInfo,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceInfoState].
extension DeviceInfoStatePatterns on DeviceInfoState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VarStatus checkNotJailBrokenStatus,  VarStatus checkRealDeviceStatus,  VarStatus checkRealLocationStatus,  VarStatus projectInfoStatus,  PackageInfo projectInfo)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.checkNotJailBrokenStatus,_that.checkRealDeviceStatus,_that.checkRealLocationStatus,_that.projectInfoStatus,_that.projectInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VarStatus checkNotJailBrokenStatus,  VarStatus checkRealDeviceStatus,  VarStatus checkRealLocationStatus,  VarStatus projectInfoStatus,  PackageInfo projectInfo)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.checkNotJailBrokenStatus,_that.checkRealDeviceStatus,_that.checkRealLocationStatus,_that.projectInfoStatus,_that.projectInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VarStatus checkNotJailBrokenStatus,  VarStatus checkRealDeviceStatus,  VarStatus checkRealLocationStatus,  VarStatus projectInfoStatus,  PackageInfo projectInfo)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.checkNotJailBrokenStatus,_that.checkRealDeviceStatus,_that.checkRealLocationStatus,_that.projectInfoStatus,_that.projectInfo);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DeviceInfoState {
  const _Initial({this.checkNotJailBrokenStatus = const VarStatus(), this.checkRealDeviceStatus = const VarStatus(), this.checkRealLocationStatus = const VarStatus(), this.projectInfoStatus = const VarStatus(), required this.projectInfo});
  

/// checkNotJailBroken
@override@JsonKey() final  VarStatus checkNotJailBrokenStatus;
/// checkRealDevice
@override@JsonKey() final  VarStatus checkRealDeviceStatus;
/// checkRealLocation
@override@JsonKey() final  VarStatus checkRealLocationStatus;
/// projectInfo
@override@JsonKey() final  VarStatus projectInfoStatus;
@override final  PackageInfo projectInfo;

/// Create a copy of DeviceInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.checkNotJailBrokenStatus, checkNotJailBrokenStatus) || other.checkNotJailBrokenStatus == checkNotJailBrokenStatus)&&(identical(other.checkRealDeviceStatus, checkRealDeviceStatus) || other.checkRealDeviceStatus == checkRealDeviceStatus)&&(identical(other.checkRealLocationStatus, checkRealLocationStatus) || other.checkRealLocationStatus == checkRealLocationStatus)&&(identical(other.projectInfoStatus, projectInfoStatus) || other.projectInfoStatus == projectInfoStatus)&&(identical(other.projectInfo, projectInfo) || other.projectInfo == projectInfo));
}


@override
int get hashCode => Object.hash(runtimeType,checkNotJailBrokenStatus,checkRealDeviceStatus,checkRealLocationStatus,projectInfoStatus,projectInfo);

@override
String toString() {
  return 'DeviceInfoState.initial(checkNotJailBrokenStatus: $checkNotJailBrokenStatus, checkRealDeviceStatus: $checkRealDeviceStatus, checkRealLocationStatus: $checkRealLocationStatus, projectInfoStatus: $projectInfoStatus, projectInfo: $projectInfo)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $DeviceInfoStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 VarStatus checkNotJailBrokenStatus, VarStatus checkRealDeviceStatus, VarStatus checkRealLocationStatus, VarStatus projectInfoStatus, PackageInfo projectInfo
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of DeviceInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkNotJailBrokenStatus = null,Object? checkRealDeviceStatus = null,Object? checkRealLocationStatus = null,Object? projectInfoStatus = null,Object? projectInfo = null,}) {
  return _then(_Initial(
checkNotJailBrokenStatus: null == checkNotJailBrokenStatus ? _self.checkNotJailBrokenStatus : checkNotJailBrokenStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,checkRealDeviceStatus: null == checkRealDeviceStatus ? _self.checkRealDeviceStatus : checkRealDeviceStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,checkRealLocationStatus: null == checkRealLocationStatus ? _self.checkRealLocationStatus : checkRealLocationStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,projectInfoStatus: null == projectInfoStatus ? _self.projectInfoStatus : projectInfoStatus // ignore: cast_nullable_to_non_nullable
as VarStatus,projectInfo: null == projectInfo ? _self.projectInfo : projectInfo // ignore: cast_nullable_to_non_nullable
as PackageInfo,
  ));
}


}

// dart format on
