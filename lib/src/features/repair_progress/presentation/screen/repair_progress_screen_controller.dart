import 'package:bato_mechanic/src/features/repair_progress/application/repair_step_service.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/enums/repair_setp_status.dart';

class RepairProgressScreenController extends StateNotifier<AsyncValue<void>> {
  RepairProgressScreenController({
    required this.ref,
  }) : super(const AsyncValue.data(null));

  Ref ref;

  Future<List<RepairStep>> fetchRepairSteps(String repairRequestIdx) async {
    state = await AsyncValue.guard(() =>
        ref.read(repairStepServiceProvider).fetchRepairSteps(repairRequestIdx));

    return state.value as List<RepairStep>;
  }

  Future<bool> updateRepairStepStatus(String repairRequest,
      String repairStepIdx, RepairStepStatus status) async {
    state = await AsyncValue.guard(() => ref
        .read(repairStepServiceProvider)
        .updateRepairStepStatus(repairRequest, repairStepIdx, status));
    return !state.hasError;
  }

  Future<bool> completeRepair(String repairStepIdx) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
        .read(repairRequestServiceProvider)
        .updateVehicleRepairRequest(repairStepIdx,
            {"status": RepairStepStatus.COMPLETE.name.toLowerCase()}));
    return !state.hasError;
  }

  Future<void> tempFun() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 20), () {
      state = const AsyncValue.data(null);
    });
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
