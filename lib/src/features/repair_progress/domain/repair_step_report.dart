// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

billImagesFromJson(List<dynamic> json) {
  return List<Map<String, String>>.from(
    json.map<Map<String, String>>((x) => {
          'idx': x['idx'],
          'image': x['image'],
        }),
  );
}

class RepairStepReport {
  final String idx;
  final List<Map<String, String>> billImages;
  RepairStepReport({
    required this.idx,
    required this.billImages,
  });
  // final List<Map<String, dynamic>> reportFields;

  RepairStepReport copyWith({
    String? idx,
    List<Map<String, String>>? billImages,
  }) {
    return RepairStepReport(
      idx: idx ?? this.idx,
      billImages: billImages ?? this.billImages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'billImages': billImages,
    };
  }

  factory RepairStepReport.fromMap(Map<String, dynamic> map) {
    return RepairStepReport(
      idx: map['idx'] as String,
      billImages: billImagesFromJson(map['bill_images'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory RepairStepReport.fromJson(String source) =>
      RepairStepReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RepairStepReport(idx: $idx, billImages: $billImages)';

  @override
  bool operator ==(covariant RepairStepReport other) {
    if (identical(this, other)) return true;

    return other.idx == idx && listEquals(other.billImages, billImages);
  }

  @override
  int get hashCode => idx.hashCode ^ billImages.hashCode;
}
