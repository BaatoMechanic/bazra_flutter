// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../repair_request/domain/user_position.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
    this.currentLocation,
    required this.role,
  });
  final String id;
  final String name;
  final String? email;
  final String phone;
  final String? profilePic;
  final UserPosition? currentLocation;
  final String role;

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profilePic,
    UserPosition? currentLocation,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePic: profilePic ?? this.profilePic,
      currentLocation: currentLocation ?? this.currentLocation,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePic': profilePic,
      'currentLocation': currentLocation?.toMap(),
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] as String,
      profilePic:
          map['profilePic'] != null ? map['profilePic'] as String : null,
      currentLocation: map['currentLocation'] != null
          ? UserPosition.fromMap(map['currentLocation'] as Map<String, dynamic>)
          : null,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, profilePic: $profilePic, currentLocation: $currentLocation, role: $role)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.profilePic == profilePic &&
        other.currentLocation == currentLocation &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        profilePic.hashCode ^
        currentLocation.hashCode ^
        role.hashCode;
  }
}
