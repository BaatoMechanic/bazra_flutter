import 'package:bato_mechanic/src/features/core/domain/abstract_user_model.dart';
import 'package:bato_mechanic/src/utils/enums/dob_type.dart';

List<User> usersFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => User.fromJson(json)).toList();
}

class User extends AbstractUserModel {
  User({
    required super.idx,
    required super.name,
    required super.email,
    required super.phone,
    required super.gender,
    required super.profilePic,
    required super.dobType,
    required super.dateOfBirth,
    required super.primaryRole,
    required super.roles,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'idx': idx,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'profile_pic': profilePic,
      'dob_type': dobTypeToJson(dobType),
      'date_of_birth': dateOfBirth,
      'primary_role': primaryRole,
      'roles': roles,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idx: json['idx'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      profilePic: json['profile_pic'],
      dobType: dobTypeFromJson(json['dob_type']),
      dateOfBirth: json['date_of_birth'],
      primaryRole: json['primary_role'],
      roles: (json['roles'] as List).map((e) => e as String).toList(),
    );
  }

  User copyWith({
    String? idx,
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? profilePic,
    bool? isPhoneVerified,
    bool? isEmailVerified,
    bool? isVerified,
    DOBType? dobType,
    DateTime? dateOfBirth,
    String? primaryRole,
    List<String>? roles,
  }) {
    return User(
      idx: idx ?? this.idx,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      profilePic: profilePic ?? this.profilePic,
      dobType: dobType ?? this.dobType,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      primaryRole: primaryRole ?? this.primaryRole,
      roles: roles ?? this.roles,
    );
  }
}
