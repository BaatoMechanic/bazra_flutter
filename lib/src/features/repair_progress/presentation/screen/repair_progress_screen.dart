import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/audio_widget.dart';
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/features/repair_progress/presentation/screen/repair_progress_screen_controller.dart';
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

import '../widgets/repair_step_bottom_sheet.dart';

class RepairProgressScreen extends ConsumerWidget {
  RepairProgressScreen({super.key, required this.repairRequestIdx});

  final String repairRequestIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRepariRequest =
        ref.watch(watchRepairRequestStateChangesProvider).value;

    final repairStepsValue =
        ref.watch(fetchRepairStepsProvider(repairRequestIdx));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Progress'),
      ),
      body: AsyncValueWidget(
        value: repairStepsValue,
        data: (repairSteps) => ListView.builder(
          itemCount: repairSteps.length,
          itemBuilder: (context, index) {
            final step = repairSteps[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text('Step ${index + 1}'),
                subtitle: Text('Status: ${step.status}'),
                trailing: IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.r16),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return RepairStepBottomSheet(step: step);
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
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
                      context.goNamed(appRoute.ReviewMechanic.name),
                )
              : null,
        ),
      ),
    );
  }
}
