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

// RepairStepStatus repairStepStautsFromJson(String status) {
//   switch (status.toUpperCase()) {
//     case "PENDING":
//       return RepairStepStatus.PENDING;
//     case "IN_PROGRESS":
//       return RepairStepStatus.IN_PROGRESS;
//     case "COMPLETE":
//       return RepairStepStatus.COMPLETE;
//     case "CANCELLED":
//       return RepairStepStatus.CANCELLED;
//     default:
//       return RepairStepStatus.PENDING;
//   }
// }

// String repairStepStautsToJson(RepairStepStatus status) {
//   switch (status) {
//     case RepairStepStatus.PENDING:
//       return "pending";
//     case RepairStepStatus.IN_PROGRESS:
//       return "in_progress";
//     case RepairStepStatus.COMPLETE:
//       return "completed";
//     case RepairStepStatus.CANCELLED:
//       return "cancelled";
//     default:
//       return "pending";
//   }
// }
