import 'package:bato_mechanic/src/common/fetch_and_watch_async_value_widget.dart';
import 'package:bato_mechanic/src/features/repair_progress/application/repair_step_service.dart';
import 'package:bato_mechanic/src/features/repair_progress/presentation/screen/repair_progress_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_progress/presentation/widgets/repair_step_shimmer_widget.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../repair_request/data/remote/repair_request_repository/fake_repair_request_repository.dart';
import '../widgets/repair_step_widget.dart';

class RepairProgressScreen extends ConsumerWidget {
  const RepairProgressScreen({super.key, required this.repairRequestIdx});

  final String repairRequestIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repairStepsValue =
        ref.watch(fetchRepairStepsProvider(repairRequestIdx));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Progress'),
      ),
      body: FetchAndWatchAsyncValueWidget(
        loadingShimmer: const RepairStepShimmerWidget(),
        fetchValue: ref.watch(fetchRepairStepsProvider(repairRequestIdx)),
        watchValue: repairStepsValue,
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
      ),
      // body: AsyncValueWidget(
      //   loadingShimmer: const RepairStepShimmerWidget(),
      //   value: repairStepsValue,
      //   data: (repairSteps) => ListView.builder(
      //     shrinkWrap: true,
      //     itemCount: repairSteps.length,
      //     itemBuilder: (context, index) {
      //       final step = repairSteps[index];
      //       return RepairStepWidget(step: step);
      //     },
      //   ),
      // ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Consumer(builder: (context, ref, child) {
            final repairRequest = ref.watch(activeRepairRequestProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (repairRequest!.status ==
                    VehicleRepairRequestStatus
                        .WAITING_FOR_COMPLETION_ACCEPTANCE)
                  ElevatedButton(
                      child: Text('Complete the process'.hardcoded()),
                      onPressed: () async {
                        if (await ref
                            .read(
                                repairProgressScreenControllerProvider.notifier)
                            .completeRepair(repairRequest.idx)) {
                          context
                              .pushNamed(APP_ROUTE.reviewMechanic.name, extra: {
                            'repairRequestIdx': repairRequest.idx,
                            "mechanicIdx": repairRequest.assignedMechanicIdx
                          });
                        }
                      }),
                if (repairRequest.status == VehicleRepairRequestStatus.COMPLETE)
                  ElevatedButton(
                      child: Text('Review the mechanic'.hardcoded()),
                      onPressed: () {
                        context.goNamed(APP_ROUTE.reviewMechanic.name, extra: {
                          'repairRequestIdx': repairRequest.idx,
                          "mechanicIdx": repairRequest.assignedMechanicIdx
                        });
                      }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
