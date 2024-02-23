// ignore_for_file: constant_identifier_names

enum RepairStepStatus {
  PENDING,
  IN_PROGRESS,
  COMPLETE,
  CANCELLED,
}

RepairStepStatus repairStepStautsFromJson(String status) {
  switch (status.toUpperCase()) {
    case "PENDING":
      return RepairStepStatus.PENDING;
    case "IN_PROGRESS":
      return RepairStepStatus.IN_PROGRESS;
    case "COMPLETE":
      return RepairStepStatus.COMPLETE;
    case "CANCELLED":
      return RepairStepStatus.CANCELLED;
    default:
      return RepairStepStatus.PENDING;
  }
}

String repairStepStautsToJson(RepairStepStatus status) {
  switch (status) {
    case RepairStepStatus.PENDING:
      return "pending";
    case RepairStepStatus.IN_PROGRESS:
      return "in_progress";
    case RepairStepStatus.COMPLETE:
      return "completed";
    case RepairStepStatus.CANCELLED:
      return "cancelled";
    default:
      return "pending";
  }
}
