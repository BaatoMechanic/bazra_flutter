// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// // To parse this JSON data, do
// //
// //     final vehicleCategory = vehicleCategoryFromJson(jsonString);

// import 'dart:convert';

// VehicleCategory vehicleCategoryFromJson(String str) =>
//     VehicleCategory.fromJson(json.decode(str));

// String vehicleCategoryToJson(VehicleCategory data) =>
//     json.encode(data.toJson());

// class VehicleCategory {
//   int id;
//   String name;
//   String image;

//   VehicleCategory({
//     required this.id,
//     required this.name,
//     required this.image,
//   });

//   factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
//       VehicleCategory(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//       };
// }

// class VehicleCategoryError {
//   int code;
//   Object message;

//   VehicleCategoryError({required this.code, required this.message});
// }

// To parse this JSON data, do
//
//     final vehicleCategory = vehicleCategoryFromJson(jsonString);

List<VehicleCategory> vehicleCategoriesFromJson(String str) =>
    List<VehicleCategory>.from(json.decode(str).map((x) {
      return VehicleCategory.fromMap(x);
    }));

class VehicleCategory {
  String idx;
  String name;
  String image;

  VehicleCategory({
    required this.idx,
    required this.name,
    required this.image,
  });

  VehicleCategory copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return VehicleCategory(
      idx: idx,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'name': name,
      'image': image,
    };
  }

  factory VehicleCategory.fromMap(Map<String, dynamic> map) {
    return VehicleCategory(
      idx: map['idx'],
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleCategory.fromJson(String source) =>
      VehicleCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VehicleCategory(id: $idx, name: $name, image: $image)';

  @override
  bool operator ==(covariant VehicleCategory other) {
    if (identical(this, other)) return true;

    return other.idx == idx && other.name == name && other.image == image;
  }

  @override
  int get hashCode => idx.hashCode ^ name.hashCode ^ image.hashCode;
}

class VehicleCategoryError {
  int code;
  Object message;

  VehicleCategoryError({required this.code, required this.message});
}
