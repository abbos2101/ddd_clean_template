// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  username: json['username'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  website: json['website'] as String? ?? '',
  address: json['address'] == null
      ? const AddressModel()
      : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  company: json['company'] == null
      ? const CompanyModel()
      : CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
      'company': instance.company,
    };

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      street: json['street'] as String? ?? '',
      suite: json['suite'] as String? ?? '',
      city: json['city'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      geo: json['geo'] == null
          ? const GeoModel()
          : GeoModel.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

_GeoModel _$GeoModelFromJson(Map<String, dynamic> json) => _GeoModel(
  lat: json['lat'] as String? ?? '',
  lng: json['lng'] as String? ?? '',
);

Map<String, dynamic> _$GeoModelToJson(_GeoModel instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
};

_CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) =>
    _CompanyModel(
      name: json['name'] as String? ?? '',
      catchPhrase: json['catchPhrase'] as String? ?? '',
      bs: json['bs'] as String? ?? '',
    );

Map<String, dynamic> _$CompanyModelToJson(_CompanyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
