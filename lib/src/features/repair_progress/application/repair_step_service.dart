import 'package:bato_mechanic/src/features/repair_progress/data/repair_step_repository.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:bato_mechanic/src/utils/enums/repair_setp_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/in_memory_store.dart';
import '../../../utils/model_utils.dart';

class RepairStepService {
  RepairStepService(this.ref);
  final Ref ref;

  Future<List<RepairStep>> fetchRepairSteps(String repairStepIdx) async {
    var response = await ref
        .read(repairStepRepositoryProvider)
        .fetchRepairSteps(repairStepIdx);

    if (response is Success) {
      final List<RepairStep> repairSteps =
          repairStepsFromJson(response.response as String);
      return repairSteps;
    }
    if (response is Failure) {
      throw Exception(response.errorResponse.toString());
    }
    return [];
  }

  Future<bool> updateRepairStepStatus(
      String repairIdx, String repairStepIdx, RepairStepStatus status) async {
    await ref
        .read(repairStepRepositoryProvider)
        .updateRepairStepStatus(repairIdx, repairStepIdx, status.name);
    return true;
  }
}

final repairStepServiceProvider = Provider<RepairStepService>((ref) {
  return RepairStepService(ref);
});

// final watchRepairStepStateChangesProvider =
//     StreamProvider<List<RepairStep>>((ref) {
//   final repairStepService = ref.watch(repairStepServiceProvider);
//   return repairStepService._allRepairStepsStateChanges();
// });
