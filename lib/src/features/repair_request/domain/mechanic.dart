// To parse this JSON data, do
//
//     final mechanic = mechanicFromJson(jsonString);

import 'dart:convert';

import 'package:bato_mechanic/src/features/repair_request/domain/user_position.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

Mechanic mechanicFromJson(String str) => Mechanic.fromJson(json.decode(str));

List<Mechanic> mechanicsFromJson(String str) =>
    List<Mechanic>.from(json.decode(str).map((x) {
      return Mechanic.fromJson(x);
    }));

String mechanicToJson(Mechanic data) => json.encode(data.toJson());

class Mechanic {
  int id;
  int userId;
  String name;
  String phoneNumber;
  String username;
  String email;
  String description;
  String image;
  String vehicleCategorySpeciality;
  UserPosition? currentLocation;
  // String? currentLocationName;
  String vehiclePartSpeciality;

  double averageRating;

  Mechanic({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.username,
    required this.email,
    required this.description,
    required this.image,
    required this.vehicleCategorySpeciality,
    required this.currentLocation,
    // required this.currentLocationName,
    required this.vehiclePartSpeciality,
    required this.averageRating,
  });

  factory Mechanic.fromJson(Map<String, dynamic> json) => Mechanic(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        username: json["username"],
        email: json["email"],
        description: json["description"],
        image: json["image"],
        vehicleCategorySpeciality: json["vehicle_speciality"],
        vehiclePartSpeciality: json["vehicle_part_speciality"],
        currentLocation:
            userPositionFromJson(jsonEncode(json['current_location'])),
        // currentLocationName: json['current_location']['location_name'],
        averageRating: double.parse(json["average_rating"].toString()),
      );

  Map<String, dynamic> toJson() {
    var userLocationJson = userPositionToJson(currentLocation!);
    Map<String, dynamic> userLocation = jsonDecode(userLocationJson);
    // userLocation['location_name'] = currentLocationName;
    return {
      "id": id,
      "user_id": userId,
      "name": name,
      "phone_number": phoneNumber,
      "username": username,
      "email": email,
      "description": description,
      "image": image,
      "vehicle_speciality": vehicleCategorySpeciality,
      "vehicle_part_speciality": vehiclePartSpeciality,
      'current_location': userLocation,
      "average_rating": averageRating,
    };
  }
}
