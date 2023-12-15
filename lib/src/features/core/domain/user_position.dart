// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:geolocator/geolocator.dart';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

// List<UserPosition> userPositionsFromJson(String str) =>
//     List<UserPosition>.from(json.decode(str).map((x) {
//       return UserPosition.fromJson(x);
//     }));

class UserPosition {
  UserPosition({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    required this.accuracy,
    required this.altitude,
    required this.heading,
    required this.speed,
    required this.speedAccuracy,
    required this.locationName,
  });

  final double? latitude;
  final double? longitude;
  final DateTime? timestamp;
  final double? accuracy;
  final double? altitude;
  final double? heading;
  final double? speed;
  final double? speedAccuracy;
  final String? locationName;

  UserPosition copyWith({
    double? latitude,
    double? longitude,
    DateTime? timestamp,
    double? accuracy,
    double? altitude,
    double? heading,
    double? speed,
    double? speedAccuracy,
    String? locationName,
  }) {
    return UserPosition(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timestamp: timestamp ?? this.timestamp,
      accuracy: accuracy ?? this.accuracy,
      altitude: altitude ?? this.altitude,
      heading: heading ?? this.heading,
      speed: speed ?? this.speed,
      speedAccuracy: speedAccuracy ?? this.speedAccuracy,
      locationName: locationName ?? this.locationName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
      'accuracy': accuracy,
      'altitude': altitude,
      'heading': heading,
      'speed': speed,
      'speed_ccuracy': speedAccuracy,
      'location_name': locationName,
    };
  }

  factory UserPosition.fromMap(Map<String, dynamic> map) {
    return UserPosition(
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      timestamp: map['timestamp'] != null
          ? DateTime.parse(map['timestamp'] as String)
          : null,
      accuracy: map['accuracy'] != null ? map['accuracy'] as double : null,
      altitude: map['altitude'] != null ? map['altitude'] as double : null,
      heading: map['heading'] != null ? map['heading'] as double : null,
      speed: map['speed'] != null ? map['speed'] as double : null,
      speedAccuracy: map['speed_accuracy'] != null
          ? map['speed_accuracy'] as double
          : null,
      locationName:
          map['location_name'] != null ? map['location_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPosition.fromJson(String source) =>
      UserPosition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserPosition(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy, altitude: $altitude, heading: $heading, speed: $speed, speedAccuracy: $speedAccuracy, locationName: $locationName)';
  }

  @override
  bool operator ==(covariant UserPosition other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.timestamp == timestamp &&
        other.accuracy == accuracy &&
        other.altitude == altitude &&
        other.heading == heading &&
        other.speed == speed &&
        other.speedAccuracy == speedAccuracy &&
        other.locationName == locationName;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
        longitude.hashCode ^
        timestamp.hashCode ^
        accuracy.hashCode ^
        altitude.hashCode ^
        heading.hashCode ^
        speed.hashCode ^
        speedAccuracy.hashCode ^
        locationName.hashCode;
  }
}
