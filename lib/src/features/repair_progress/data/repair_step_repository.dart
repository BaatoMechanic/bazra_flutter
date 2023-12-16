import 'package:bato_mechanic/src/features/repair_progress/data/fake_repair_step_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/enums/repair_setp_status.dart';
import 'api_repair_step_repository.dart';

abstract class RepairStepRepository {
  Future<dynamic> fetchRepairSteps(String repairStepIdx);
  Future<dynamic> updateRepairStepStatus(
      String repairRequestIdx, String repairStepIdx, String status);
}

final repairStepRepositoryProvider = Provider<RepairStepRepository>((ref) {
  // return APIRepairStepRepository(ref: ref);
  return FakeRepairStepRepository();
});
