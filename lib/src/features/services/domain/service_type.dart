// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/enums/service_type_options.dart';

List<Service> serviceTypesFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => Service.fromMap(json)).toList();
}

class Service {
  final String idx;
  final String name;
  final ServiceTypeOption type;
  final IconData? icon;
  final List<String> partsIncludedIdx;
  Service({
    required this.idx,
    required this.name,
    required this.type,
    this.icon,
    required this.partsIncludedIdx,
  });

  Service copyWith({
    String? idx,
    String? name,
    ServiceTypeOption? type,
    IconData? icon,
    List<String>? partsIncludedIdx,
  }) {
    return Service(
      idx: idx ?? this.idx,
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      partsIncludedIdx: partsIncludedIdx ?? this.partsIncludedIdx,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'name': name,
      'type': type,
      'icon': icon?.codePoint,
      'partsIncludedIdx': partsIncludedIdx,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      idx: map['idx'] as String,
      name: map['name'] as String,
      // type: ServiceTypeOption.fromMap(map['type'] as Map<String,dynamic>),
      type: serviceTypeOptionFromJson(map['type']),
      icon: map['icon'] != null
          ? IconData(map['icon'] as int, fontFamily: 'MaterialIcons')
          : null,
      partsIncludedIdx: List<String>.from(
        (map['parts_included'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceType(idx: $idx, name: $name, type: $type, icon: $icon, partsIncludedIdx: $partsIncludedIdx)';
  }

  @override
  bool operator ==(covariant Service other) {
    if (identical(this, other)) return true;

    return other.idx == idx &&
        other.name == name &&
        other.type == type &&
        other.icon == icon &&
        listEquals(other.partsIncludedIdx, partsIncludedIdx);
  }

  @override
  int get hashCode {
    return idx.hashCode ^
        name.hashCode ^
        type.hashCode ^
        icon.hashCode ^
        partsIncludedIdx.hashCode;
  }
}
