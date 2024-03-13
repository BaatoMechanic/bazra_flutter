// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum RepairStepStatus {
  @JsonValue("pending")
  PENDING,
  @JsonValue("in_progress")
  IN_PROGRESS,
  @JsonValue("completed")
  COMPLETE,
  @JsonValue("cancelled")
  CANCELLED,
}
