import 'package:bato_mechanic/src/features/repair_progress/data/repair_step_repository.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/in_memory_store.dart';
import '../../../utils/model_utils.dart';

class RepairStepService {
  RepairStepService(this.ref);
  final Ref ref;

  final _allRepairStepsState = InMemoryStore<List<RepairStep>>([]);

  Stream<List<RepairStep>> _allRepairStepsStateChanges() =>
      _allRepairStepsState.stream;
  List<RepairStep> get allRepairSteps => _allRepairStepsState.value;

  void setAllRepairSteps(List<RepairStep> repairSteps) {
    _allRepairStepsState.value = repairSteps;
  }

  Future<dynamic> fetchRepairSteps(String repairStepIdx) async {
    if (allRepairSteps.isNotEmpty) {
      return allRepairSteps;
    }

    var response = await ref
        .read(repairStepRepositoryProvider)
        .fetchRepairSteps(repairStepIdx);

    if (response is Success) {
      final List<RepairStep> repairSteps =
          repairStepsFromJson(response.response as String);
      setAllRepairSteps(repairSteps);
      return repairSteps;
    }
    if (response is Failure) {
      throw Exception(response.errorResponse.toString());
    }
    return [];
  }
}

final repairStepServiceProvider = Provider<RepairStepService>((ref) {
  return RepairStepService(ref);
});
