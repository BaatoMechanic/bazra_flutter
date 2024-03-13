import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../utils/enums/repair_setp_status.dart';
import 'repair_step_report.dart';

part 'repair_step.freezed.dart';
part 'repair_step.g.dart';

class FileConverter implements JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? json) {
    return json != null ? File(json) : null;
  }

  @override
  String? toJson(File? file) {
    return file?.path;
  }
}

List<RepairStep> repairStepsFromJson(List<dynamic> list) {
  return list.map((repairStep) => RepairStep.fromJson(repairStep)).toList();
}

@freezed
class RepairStep with _$RepairStep {
  const factory RepairStep({
    required String idx,
    required String name,
    required String? textDescription,
    @FileConverter() required File? audioDescription,
    required RepairStepStatus status,
    required RepairStepReport? report,
  }) = _RepairStep;

  factory RepairStep.fromJson(Map<String, dynamic> json) =>
      _$RepairStepFromJson(json);
}
