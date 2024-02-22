// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

List<MechanicTip> mechanicTipsFromJson(String jsonString) =>
    List<MechanicTip>.from(
        json.decode(jsonString).map((x) => MechanicTip.fromMap(x)));

class MechanicTip {
  String idx;
  String tip;
  Map<String, dynamic> mechanic;
  MechanicTip({
    required this.idx,
    required this.tip,
    required this.mechanic,
  });

  MechanicTip copyWith({
    String? idx,
    String? tip,
    Map<String, dynamic>? mechanic,
  }) {
    return MechanicTip(
      idx: idx ?? this.idx,
      tip: tip ?? this.tip,
      mechanic: mechanic ?? this.mechanic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'tip': tip,
      'mechanic': mechanic,
    };
  }

  factory MechanicTip.fromMap(Map<String, dynamic> map) {
    return MechanicTip(
      idx: map['idx'] as String,
      tip: map['tip'] as String,
      mechanic: Map<String, dynamic>.from(
        (map['mechanic'] as Map<String, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MechanicTip.fromJson(String source) =>
      MechanicTip.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MechanicTip(idx: $idx, tip: $tip, mechanic: $mechanic)';

  @override
  bool operator ==(covariant MechanicTip other) {
    if (identical(this, other)) return true;

    return other.idx == idx &&
        other.tip == tip &&
        mapEquals(other.mechanic, mechanic);
  }

  @override
  int get hashCode => idx.hashCode ^ tip.hashCode ^ mechanic.hashCode;
}
