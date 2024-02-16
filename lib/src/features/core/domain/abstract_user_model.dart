// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bato_mechanic/src/utils/enums/dob_type.dart';
import 'package:flutter/foundation.dart';

import '../../core/domain/user_position.dart';

// List<User> usersFromJson(List<dynamic> jsonList) {
//   return jsonList.map((json) => User.fromMap(json)).toList();
// }

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
  // final Map<String, dynamic> additionalAttributes;
}
