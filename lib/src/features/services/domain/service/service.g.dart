// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      idx: json['idx'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ServiceTypeOptionEnumMap, json['type']),
      image: json['image'] as String?,
      icon: json['icon_data'] as String?,
      partsIncludedIdx: (json['parts_included'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'name': instance.name,
      'type': _$ServiceTypeOptionEnumMap[instance.type]!,
      'image': instance.image,
      'icon_data': instance.icon,
      'parts_included': instance.partsIncludedIdx,
    };

const _$ServiceTypeOptionEnumMap = {
  ServiceTypeOption.BODY_REPAIR: 'body_repair',
  ServiceTypeOption.ENGINE_REPAIR: 'engine_repair',
  ServiceTypeOption.ELECTRICAL_REPAIR: 'electrical_repair',
  ServiceTypeOption.WHEEL_REPAIR: 'wheel_repair',
  ServiceTypeOption.PAINTING: 'painting',
  ServiceTypeOption.OTHER: 'other',
};
