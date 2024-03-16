import 'package:bato_mechanic/src/features/repair_progress/presentation/widgets/repair_step_shimmer_widget.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/api_repair_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/async_value_widget.dart';
import 'repair_step_widget.dart';

class RepairStepsWidget extends ConsumerWidget {
  const RepairStepsWidget({super.key, required this.repairRequestIdx});

  final String repairRequestIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      loadingShimmer: const RepairStepShimmerWidget(),
      value: ref.watch(watchRepairStepsProvider(repairRequestIdx)),
      data: (repairSteps) => ListView.builder(
        shrinkWrap: true,
        itemCount: repairSteps.length,
        itemBuilder: (context, index) {
          final step = repairSteps[index];
          return RepairStepWidget(
            repairRequestIdx: repairRequestIdx,
            step: step,
          );
        },
      ),
    );
  }
}
