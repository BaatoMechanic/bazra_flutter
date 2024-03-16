import 'package:bato_mechanic/src/shared/utils/enums/dob_type.dart';

abstract class AbstractUserModel {
  final String idx;
  final String name;
  final String? email;
  final String? phone;
  final String? gender;
  final String? profilePic;
  final DOBType dobType;
  final DateTime? dateOfBirth;

  final String? primaryRole;
  final List<String> roles;

  AbstractUserModel(
      {required this.idx,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.profilePic,
      required this.dobType,
      required this.dateOfBirth,
      required this.primaryRole,
      required this.roles});
}
