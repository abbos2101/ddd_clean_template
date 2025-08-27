import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String username,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String website,
    @Default(AddressModel()) AddressModel address,
    @Default(CompanyModel()) CompanyModel company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    @Default('') String street,
    @Default('') String suite,
    @Default('') String city,
    @Default('') String zipcode,
    @Default(GeoModel()) GeoModel geo,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@freezed
abstract class GeoModel with _$GeoModel {
  const factory GeoModel({@Default('') String lat, @Default('') String lng}) =
      _GeoModel;

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);
}

@freezed
abstract class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    @Default('') String name,
    @Default('') String catchPhrase,
    @Default('') String bs,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}
