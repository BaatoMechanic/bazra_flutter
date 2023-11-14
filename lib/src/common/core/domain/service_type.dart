// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bato_mechanic/src/utils/enums/service_type_options.dart';
import 'package:flutter/material.dart';

import '../../../features/repair_request/domain/vehicle_part.dart';

class ServiceType {
  final String id;
  final String name;
  final ServiceTypeOption type;
  final IconData? icon;
  final List<VehiclePart> partsIncluded;
  ServiceType({
    required this.id,
    required this.name,
    required this.type,
    this.icon,
    required this.partsIncluded,
  });

  ServiceType copyWith({
    String? id,
    String? name,
    ServiceTypeOption? type,
    IconData? icon,
    List<VehiclePart>? partsIncluded,
  }) {
    return ServiceType(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      partsIncluded: partsIncluded ?? this.partsIncluded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type.name,
      'icon': icon,
      'partsIncluded': partsIncluded.map((x) => x.toMap()).toList(),
    };
  }

  factory ServiceType.fromMap(Map<String, dynamic> map) {
    return ServiceType(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'],
      // type: ServiceTypeOption.fromMap(map['type'] as Map<String, dynamic>),
      icon: map['icon'],
      partsIncluded: List<VehiclePart>.from(
        (map['partsIncluded'] as List<int>).map<VehiclePart>(
          (x) => VehiclePart.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceType.fromJson(String source) =>
      ServiceType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceType(id: $id, name: $name, type: $type, icon: $icon partsIncluded: $partsIncluded)';
  }

  @override
  bool operator ==(covariant ServiceType other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.icon == icon &&
        listEquals(other.partsIncluded, partsIncluded);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        icon.hashCode ^
        partsIncluded.hashCode;
  }
}
