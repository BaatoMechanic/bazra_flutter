// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      idx: json['idx'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      profilePic: json['image'] as String?,
      dobType: $enumDecode(_$DOBTypeEnumMap, json['dob_type']),
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      primaryRole: json['primary_role'] as String?,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'image': instance.profilePic,
      'dob_type': _$DOBTypeEnumMap[instance.dobType]!,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'primary_role': instance.primaryRole,
      'roles': instance.roles,
    };

const _$DOBTypeEnumMap = {
  DOBType.BS: 'bs',
  DOBType.AD: 'ad',
};
