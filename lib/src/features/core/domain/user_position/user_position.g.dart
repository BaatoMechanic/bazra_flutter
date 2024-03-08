// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPositionImpl _$$UserPositionImplFromJson(Map<String, dynamic> json) =>
    _$UserPositionImpl(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      speedAccuracy: (json['speed_accuracy'] as num?)?.toDouble(),
      locationName: json['location_name'] as String?,
    );

Map<String, dynamic> _$$UserPositionImplToJson(_$UserPositionImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp?.toIso8601String(),
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'heading': instance.heading,
      'speed': instance.speed,
      'speed_accuracy': instance.speedAccuracy,
      'location_name': instance.locationName,
    };
