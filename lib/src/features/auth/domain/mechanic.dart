import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bato_mechanic/src/features/core/domain/abstract_user_model.dart';
import '../../../utils/enums/dob_type.dart';

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
    @JsonKey(name: 'image') required String? profilePic,
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
