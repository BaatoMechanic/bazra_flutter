// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehiclePartImpl _$$VehiclePartImplFromJson(Map<String, dynamic> json) =>
    _$VehiclePartImpl(
      idx: json['idx'] as String,
      name: json['name'] as String,
      vehicleCategoryIdx: json['vehicle_category_idx'] as String,
      image: json['image'] as String?,
      isMultiple: json['is_multiple'] as bool,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$$VehiclePartImplToJson(_$VehiclePartImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'name': instance.name,
      'vehicle_category_idx': instance.vehicleCategoryIdx,
      'image': instance.image,
      'is_multiple': instance.isMultiple,
      'position': instance.position,
    };
