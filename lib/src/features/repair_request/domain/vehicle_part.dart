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
  int id;
  String name;
  int vehicleCategoryId;
  String? image;
  bool isMultiple;
  String? position;

  VehiclePart({
    required this.id,
    required this.name,
    required this.vehicleCategoryId,
    required this.image,
    required this.isMultiple,
    this.position,
  });

  factory VehiclePart.fromJson(Map<String, dynamic> json) => VehiclePart(
        id: json["id"],
        name: json["name"].toString().capitalize(),
        vehicleCategoryId: json["vehicle"],
        image: json["image"],
        isMultiple: json["is_multiple"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toLowerCase(),
        "vehicle": vehicleCategoryId,
        "image": image,
        "is_multiple": isMultiple,
        "position": position,
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'vehicleCategoryId': vehicleCategoryId,
      'image': image,
      'isMultiple': isMultiple,
      'position': position,
    };
  }

  factory VehiclePart.fromMap(Map<String, dynamic> map) {
    return VehiclePart(
      id: map['id'] as int,
      name: map['name'] as String,
      vehicleCategoryId: map['vehicleCategoryId'] as int,
      image: map['image'] != null ? map['image'] as String : null,
      isMultiple: map['isMultiple'] as bool,
      position: map['position'] != null ? map['position'] as String : null,
    );
  }
}
