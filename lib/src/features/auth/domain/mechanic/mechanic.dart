// import 'package:bato_mechanic/src/features/core/domain/abstract_user_model.dart';
// import 'package:bato_mechanic/src/utils/enums/dob_type.dart';

// List<Mechanic> mechanicsFromJson(List<dynamic> jsonList) {
//   return jsonList.map((json) => Mechanic.fromJson(json)).toList();
// }

// class Mechanic extends AbstractUserModel {
//   Mechanic({
//     required super.idx,
//     required super.name,
//     required super.email,
//     required super.phone,
//     required super.gender,
//     required super.profilePic,
//     required super.dobType,
//     required super.dateOfBirth,
//     required super.primaryRole,
//     required super.roles,
//     required this.vehicleSpecialityIdx,
//     required this.serviceSpecialityIdx,
//     required this.additionalAttributes,
//     this.description,
//   });

//   final String vehicleSpecialityIdx;
//   final String serviceSpecialityIdx;
//   final String? description;
//   final Map<String, dynamic> additionalAttributes;

//   Map<String, dynamic> toJson() {
//     return {
//       'idx': idx,
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'gender': gender,
//       'profile_pic': profilePic,
//       'dob_type': dobType,
//       'date_of_birth': dateOfBirth,
//       'primary_role': primaryRole,
//       'roles': roles,
//       'vehicle_speciality': vehicleSpecialityIdx,
//       'service_speciality': serviceSpecialityIdx,
//       'description': description,
//       "additional_attributes": additionalAttributes,
//     };
//   }

//   factory Mechanic.fromJson(Map<String, dynamic> json) {
//     return Mechanic(
//       idx: json['idx'],
//       name: json['name'],
//       email: json['email'],
//       phone: json['phone'],
//       gender: json['gender'],
//       profilePic: json['profile_pic'],
//       dobType: dobTypeFromJson(json['dob_type']),
//       dateOfBirth: json['date_of_birth'],
//       primaryRole: json['primary_role'],
//       roles: json['roles'] ?? [],
//       vehicleSpecialityIdx: json['vehicle_speciality'],
//       serviceSpecialityIdx: json['service_speciality'],
//       description: json['description'],
//       additionalAttributes: json['additional_attributes'],
//     );
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bato_mechanic/src/features/core/domain/abstract_user_model.dart';
import '../../../../utils/enums/dob_type.dart';

part 'mechanic.freezed.dart';
part 'mechanic.g.dart';

List<Mechanic> mechanicsFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => Mechanic.fromJson(json)).toList();
}

@freezed
class Mechanic extends AbstractUserModel with _$Mechanic {
  const factory Mechanic({
    required String idx,
    required String name,
    required String? email,
    required String? phone,
    required String? gender,
    @JsonKey(name: 'profile_pic') required String? profilePic,
    @JsonKey(name: 'dob_type') required DOBType dobType,
    @JsonKey(name: "date_of_birth") required DateTime? dateOfBirth,
    @JsonKey(name: "primary_role") required String? primaryRole,
    required List<String> roles,
    @JsonKey(name: "vehicle_speciality") required String vehicleSpecialityIdx,
    @JsonKey(name: "service_speciality") required String serviceSpecialityIdx,
    required String? description,
    @JsonKey(name: "additional_attributes")
    required Map<String, dynamic> additionalAttributes,
  }) = _Mechanic;

  factory Mechanic.fromJson(Map<String, dynamic> json) =>
      _$MechanicFromJson(json);
}
