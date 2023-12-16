import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bato_mechanic/src/common/fetch_and_watch_async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/audio_widget.dart';
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/features/repair_progress/application/repair_step_service.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step.dart';
import 'package:bato_mechanic/src/features/repair_progress/presentation/screen/repair_progress_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_progress/presentation/widgets/repair_step_shimmer_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/style_manager.dart';
import 'package:bato_mechanic/src/utils/data_types/string_or_audio.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../widgets/repair_step_bottom_sheet.dart';
import '../widgets/repair_step_widget.dart';

class RepairProgressScreen extends ConsumerWidget {
  RepairProgressScreen({super.key, required this.repairRequestIdx});

  final String repairRequestIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRepariRequest =
        ref.watch(watchRepairRequestStateChangesProvider).value;

    final repairStepsValue = ref.watch(watchRepairStepStateChangesProvider);

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
            return RepairStepWidget(step: step);
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
          child: activeRepariRequest?.status ==
                  VehicleRepairRequestStatus.WAITING_COMPLETION_ACCEPTANCE
              ? ElevatedButton(
                  child: Text('Complete the process'.hardcoded()),
                  onPressed: () =>
                      context.goNamed(APP_ROUTE.reviewMechanic.name),
                )
              : null,
        ),
      ),
    );
  }
}
