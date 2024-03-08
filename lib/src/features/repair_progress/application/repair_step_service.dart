import 'package:bato_mechanic/src/features/repair_progress/data/repair_step_repository.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step.dart';
import 'package:bato_mechanic/src/utils/enums/repair_setp_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repair_step_service.g.dart';

class RepairStepService {
  RepairStepService(this.ref);
  final Ref ref;

  Future<List<RepairStep>> fetchRepairSteps(String repairRequestIdx) async {
    var response = await ref
        .read(repairStepRepositoryProvider)
        .fetchRepairSteps(repairRequestIdx);

    return repairStepsFromJson(response);
  }

  Future<bool> updateRepairStepStatus(
      String repairIdx, String repairStepIdx, RepairStepStatus status) async {
    String statusName = status.name.toLowerCase().replaceAll(" ", "_");
    await ref
        .read(repairStepRepositoryProvider)
        .updateRepairStepStatus(repairIdx, repairStepIdx, statusName);
    return true;
  }
}

@riverpod
RepairStepService repairStepService(RepairStepServiceRef ref) =>
    RepairStepService(ref);
