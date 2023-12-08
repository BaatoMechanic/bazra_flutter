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
    required this.additionalAttributes,
  });
  final String idx;
  final String name;
  final String? email;
  final String? phone;
  final String? profilePic;
  final UserPosition? currentLocation;
  final String? primaryRole;
  final List<String> roles;
  final Map<String, dynamic> additionalAttributes;

  User copyWith({
    String? idx,
    String? name,
    String? email,
    String? phone,
    String? profilePic,
    UserPosition? currentLocation,
    String? primaryRole,
    List<String>? roles,
    Map<String, dynamic>? additionalAttributes,
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
      additionalAttributes: additionalAttributes ?? this.additionalAttributes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'name': name,
      'email': email,
      'phone': phone,
      'profile_pic': profilePic,
      'current_location': currentLocation?.toMap(),
      'primary_role': primaryRole,
      'roles': roles,
      'additional_attributes': additionalAttributes,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      idx: map['idx'] as String,
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      profilePic:
          map['profile_pic'] != null ? map['profile_pic'] as String : null,
      currentLocation: map['current_location'] != null
          ? UserPosition.fromMap(
              map['current_location'] as Map<String, dynamic>)
          : null,
      primaryRole:
          map['primary_role'] != null ? map['primary_role'] as String : null,
      roles: List<String>.from(
        map['roles'],
      ),
      additionalAttributes: Map<String, dynamic>.from(
        (map['additional_attributes'] as Map<String, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(idx: $idx, name: $name, email: $email, phone: $phone, profilePic: $profilePic, currentLocation: $currentLocation, primaryRole: $primaryRole, roles: $roles, additionalAttributes: $additionalAttributes)';
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
        listEquals(other.roles, roles) &&
        mapEquals(other.additionalAttributes, additionalAttributes);
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
        roles.hashCode ^
        additionalAttributes.hashCode;
  }
}
