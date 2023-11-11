// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

UserPosition userPositionFromJson(String str) =>
    UserPosition.fromJson(json.decode(str));

// List<UserPosition> userPositionsFromJson(String str) =>
//     List<UserPosition>.from(json.decode(str).map((x) {
//       return UserPosition.fromJson(x);
//     }));

String userPositionToJson(UserPosition data) => json.encode(data.toJson());

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

  final double latitude;
  final double longitude;
  final DateTime? timestamp;
  final double accuracy;
  final double altitude;
  final double heading;
  final double speed;
  final double speedAccuracy;
  final String? locationName;

  factory UserPosition.fromJson(Map<String, dynamic> json) => UserPosition(
        latitude: json["latitude"],
        longitude: json["longitude"],
        timestamp: DateTime.parse(json["timestamp"]),
        accuracy: json["accuracy"].toDouble(),
        altitude: json["altitude"].toDouble(),
        heading: json["heading"].toDouble(),
        speed: json["speed"].toDouble(),
        speedAccuracy: json["speed_accuracy"].toDouble(),
        locationName: json["location_name"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timestamp": timestamp,
        "accuracy": accuracy,
        "altitude": altitude,
        "heading": heading,
        "speed": speed,
        "speed_accuracy": speedAccuracy,
        "location_name": locationName,
      };

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
      'timestamp': timestamp?.millisecondsSinceEpoch,
      'accuracy': accuracy,
      'altitude': altitude,
      'heading': heading,
      'speed': speed,
      'speedAccuracy': speedAccuracy,
      'locationName': locationName,
    };
  }

  factory UserPosition.fromMap(Map<String, dynamic> map) {
    return UserPosition(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      timestamp: map['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int)
          : null,
      accuracy: map['accuracy'] as double,
      altitude: map['altitude'] as double,
      heading: map['heading'] as double,
      speed: map['speed'] as double,
      speedAccuracy: map['speedAccuracy'] as double,
      locationName: map['locationName'] as String,
    );
  }
}
