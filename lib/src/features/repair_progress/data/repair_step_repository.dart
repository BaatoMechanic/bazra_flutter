import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_repair_step_repository.dart';

abstract class RepairStepRepository {
  Future<dynamic> fetchRepairSteps(String repairStepIdx);
}

final repairStepRepositoryProvider = Provider<RepairStepRepository>((ref) {
  return APIRepairStepRepository(ref: ref);
});
