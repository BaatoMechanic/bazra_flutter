// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MechanicImpl _$$MechanicImplFromJson(Map<String, dynamic> json) =>
    _$MechanicImpl(
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
      vehicleSpecialityIdx: json['vehicle_speciality'] as String,
      serviceSpecialityIdx: json['service_speciality'] as String,
      description: json['description'] as String?,
      additionalAttributes:
          json['additional_attributes'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$MechanicImplToJson(_$MechanicImpl instance) =>
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
      'vehicle_speciality': instance.vehicleSpecialityIdx,
      'service_speciality': instance.serviceSpecialityIdx,
      'description': instance.description,
      'additional_attributes': instance.additionalAttributes,
    };

const _$DOBTypeEnumMap = {
  DOBType.BS: 'bs',
  DOBType.AD: 'ad',
};
