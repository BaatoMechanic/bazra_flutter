enum RepairStepStatus {
  PENDING,
  IN_PROGRESS,
  COMPLETED,
  CANCELLED,
}

RepairStepStatus repairStepStautsFromJson(String status) {
  switch (status.toUpperCase()) {
    case "PENDING":
      return RepairStepStatus.PENDING;
    case "IN_PROGRESS":
      return RepairStepStatus.IN_PROGRESS;
    case "COMPLETED":
      return RepairStepStatus.COMPLETED;
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
    case RepairStepStatus.COMPLETED:
      return "completed";
    case RepairStepStatus.CANCELLED:
      return "cancelled";
    default:
      return "pending";
  }
}
