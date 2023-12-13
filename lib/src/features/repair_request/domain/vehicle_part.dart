// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final vehiclePart = vehiclePartFromJson(jsonString);

import 'dart:convert';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

VehiclePart vehiclePartFromJson(String str) =>
    VehiclePart.fromJson(json.decode(str));

List<VehiclePart> vehiclePartsFromJson(String str) =>
    List<VehiclePart>.from(json.decode(str).map((x) {
      return VehiclePart.fromJson(x);
    }));

String vehiclePartToJson(VehiclePart data) => json.encode(data.toJson());

class VehiclePart {
  String idx;
  String name;
  String vehicleCategoryIdx;
  String? image;
  bool isMultiple;
  String? position;

  VehiclePart({
    required this.idx,
    required this.name,
    required this.vehicleCategoryIdx,
    this.image,
    required this.isMultiple,
    this.position,
  });

  VehiclePart copyWith({
    String? idx,
    String? name,
    String? vehicleCategoryIdx,
    String? image,
    bool? isMultiple,
    String? position,
  }) {
    return VehiclePart(
      idx: idx ?? this.idx,
      name: name ?? this.name,
      vehicleCategoryIdx: vehicleCategoryIdx ?? this.vehicleCategoryIdx,
      image: image ?? this.image,
      isMultiple: isMultiple ?? this.isMultiple,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'name': name,
      'vehicleCategoryIdx': vehicleCategoryIdx,
      'image': image,
      'isMultiple': isMultiple,
      'position': position,
    };
  }

  factory VehiclePart.fromMap(Map<String, dynamic> map) {
    return VehiclePart(
      idx: map['idx'] as String,
      name: map['name'] as String,
      vehicleCategoryIdx: map['vehicleCategoryIdx'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      isMultiple: map['isMultiple'] as bool,
      position: map['position'] != null ? map['position'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehiclePart.fromJson(String source) =>
      VehiclePart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VehiclePart(idx: $idx, name: $name, vehicleCategoryIdx: $vehicleCategoryIdx, image: $image, isMultiple: $isMultiple, position: $position)';
  }

  @override
  bool operator ==(covariant VehiclePart other) {
    if (identical(this, other)) return true;

    return other.idx == idx &&
        other.name == name &&
        other.vehicleCategoryIdx == vehicleCategoryIdx &&
        other.image == image &&
        other.isMultiple == isMultiple &&
        other.position == position;
  }

  @override
  int get hashCode {
    return idx.hashCode ^
        name.hashCode ^
        vehicleCategoryIdx.hashCode ^
        image.hashCode ^
        isMultiple.hashCode ^
        position.hashCode;
  }
}
