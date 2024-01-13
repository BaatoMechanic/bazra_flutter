import 'package:bato_mechanic/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_repair_step_repository.dart';
import 'fake_repair_step_repository.dart';

abstract class RepairStepRepository {
  Future<dynamic> fetchRepairSteps(String repairStepIdx);
  Future<dynamic> updateRepairStepStatus(
      String repairRequestIdx, String repairStepIdx, String status);
}

final repairStepRepositoryProvider = Provider<RepairStepRepository>((ref) {
  if (SHOW_FAKE) return FakeRepairStepRepository();
  return APIRepairStepRepository(ref: ref);
  // return FakeRepairStepRepository();
});
