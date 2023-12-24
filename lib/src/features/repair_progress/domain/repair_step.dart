// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/utils/enums/repair_setp_status.dart';

import 'repair_step_report.dart';

List<RepairStep> repairStepsFromJson(String str) =>
    List<RepairStep>.from(json.decode(str).map((x) => RepairStep.fromMap(x)));

class RepairStep {
  String idx;
  final String name;
  final String? textDescription;
  final File? audioDescription;
  // final StringOrAudio? detail;
  final RepairStepStatus status;
  final RepairStepReport? report;

  RepairStep({
    required this.idx,
    required this.name,
    required this.textDescription,
    required this.audioDescription,
    // required this.detail,
    required this.status,
    this.report,
  });

  RepairStep copyWith({
    String? idx,
    String? name,
    String? textDescription,
    File? audioDescription,
    // StringOrAudio? detail,
    RepairStepStatus? status,
    RepairStepReport? report,
  }) {
    return RepairStep(
      idx: idx ?? this.idx,
      name: name ?? this.name,
      textDescription: textDescription ?? this.textDescription,
      audioDescription: audioDescription ?? this.audioDescription,
      // detail: detail ?? this.detail,
      status: status ?? this.status,
      report: report ?? this.report,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'name': name,
      'text_description': textDescription,
      'audio_description': audioDescription,
      // 'detail': detail,
      'status': repairStepStautsToJson(status),
      'report': report,
    };
  }

  factory RepairStep.fromMap(Map<String, dynamic> map) {
    return RepairStep(
      idx: map['idx'] as String,
      name: map['name'] as String,
      textDescription: map['text_description'],
      // audioDescription: map['audio_description'] != null
      //     ? File.fromUri(map['audio_description'])
      //     : null,
      audioDescription:
          map['audio_description']?.let(File.fromUri(map['audio_description'])),
      // detail: map['detail'],
      status: repairStepStautsFromJson(map['status']),
      report: map['report'] != null
          ? RepairStepReport.fromMap(map['report'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RepairStep.fromJson(String source) =>
      RepairStep.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RepairStep(idx: $idx, name: $name, textDescription: $textDescription, audioDescription: $audioDescription, status: $status, report: $report)';
  }

  @override
  bool operator ==(covariant RepairStep other) {
    if (identical(this, other)) return true;

    return other.idx == idx &&
        other.name == name &&
        other.textDescription == textDescription &&
        other.audioDescription == audioDescription &&
        // other.detail == detail &&
        other.status == status &&
        other.report == report;
  }

  @override
  int get hashCode {
    return idx.hashCode ^
        name.hashCode ^
        textDescription.hashCode ^
        audioDescription.hashCode ^
        // detail.hashCode ^
        status.hashCode ^
        report.hashCode;
  }
}
