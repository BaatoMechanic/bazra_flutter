import 'package:bato_mechanic/src/features/repair_progress/application/repair_step_service.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/repair_request_repository/repair_request_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepairProgressScreenController extends StateNotifier<AsyncValue<void>> {
  RepairProgressScreenController({
    required this.ref,
  }) : super(AsyncValue.data(null));

  Ref ref;

  Future<List<RepairStep>> fetchRepairSteps(String repairStepIdx) async {
    await AsyncValue.guard(() =>
        ref.read(repairStepServiceProvider).fetchRepairSteps(repairStepIdx));

    return state.value as List<RepairStep>;
  }
}

final repairProgressScreenControllerProvider =
    StateNotifierProvider<RepairProgressScreenController, AsyncValue<void>>(
        (ref) {
  return RepairProgressScreenController(ref: ref);
});

final fetchRepairStepsProvider =
    FutureProvider.family<List<RepairStep>, String>((ref, repairStepIdx) {
  return ref
      .watch(repairProgressScreenControllerProvider.notifier)
      .fetchRepairSteps(repairStepIdx);
});
