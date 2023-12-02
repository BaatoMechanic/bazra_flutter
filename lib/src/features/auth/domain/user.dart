// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../repair_request/domain/user_position.dart';

class User {
  User({
    required this.idx,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
    this.currentLocation,
    required this.primaryRole,
    required this.roles,
  });
  final String idx;
  final String name;
  final String? email;
  final String? phone;
  final String? profilePic;
  final UserPosition? currentLocation;
  final String? primaryRole;
  final List<String> roles;

  User copyWith({
    String? idx,
    String? name,
    String? email,
    String? phone,
    String? profilePic,
    UserPosition? currentLocation,
    String? primaryRole,
    List<String>? roles,
  }) {
    return User(
      idx: idx ?? this.idx,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePic: profilePic ?? this.profilePic,
      currentLocation: currentLocation ?? this.currentLocation,
      primaryRole: primaryRole ?? this.primaryRole,
      roles: roles ?? this.roles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePic': profilePic,
      'currentLocation': currentLocation?.toMap(),
      'primaryRole': primaryRole,
      'roles': roles,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        idx: map['idx'] as String,
        name: map['name'] as String,
        email: map['email'] != null ? map['email'] as String : null,
        phone: map['phone'] != null ? map['phone'] as String : null,
        profilePic: map['image'] != null ? map['image'] as String : null,
        currentLocation: map['currentLocation'] != null
            ? UserPosition.fromMap(
                map['currentLocation'] as Map<String, dynamic>)
            : null,
        primaryRole: map['primary_role'],
        roles: List<String>.from(
          (map['roles'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(idx: $idx, name: $name, email: $email, phone: $phone, profilePic: $profilePic, currentLocation: $currentLocation, primaryRole: $primaryRole, roles: $roles)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.idx == idx &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.profilePic == profilePic &&
        other.currentLocation == currentLocation &&
        other.primaryRole == primaryRole &&
        listEquals(other.roles, roles);
  }

  @override
  int get hashCode {
    return idx.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        profilePic.hashCode ^
        currentLocation.hashCode ^
        primaryRole.hashCode ^
        roles.hashCode;
  }
}
