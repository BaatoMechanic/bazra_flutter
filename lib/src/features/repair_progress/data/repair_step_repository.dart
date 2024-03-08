import 'package:bato_mechanic/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_repair_step_repository.dart';
import 'fake_repair_step_repository.dart';

part 'repair_step_repository.g.dart';

abstract class RepairStepRepository {
  Future<dynamic> fetchRepairSteps(String repairStepIdx);
  Future<dynamic> updateRepairStepStatus(
      String repairRequestIdx, String repairStepIdx, String status);
}

@riverpod
RepairStepRepository repairStepRepository(RepairStepRepositoryRef ref) =>
    SHOW_FAKE ? FakeRepairStepRepository() : APIRepairStepRepository(ref: ref);
