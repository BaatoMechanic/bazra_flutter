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
