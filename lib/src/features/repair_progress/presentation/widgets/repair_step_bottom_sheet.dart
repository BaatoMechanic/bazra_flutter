import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step_report.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/audio_widget.dart';
import '../../../../utils/constants/managers/font_manager.dart';
import '../../../../utils/constants/managers/style_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/enums/repair_setp_status.dart';
import '../../domain/repair_step.dart';
import '../repair_progress_screen_controller.dart';

class RepairStepBottomSheet extends ConsumerWidget {
  const RepairStepBottomSheet({
    super.key,
    required this.repairRequestIdx,
    required this.step,
  });

  final String repairRequestIdx;

  final RepairStep step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              step.name,
              style: getBoldStyle().copyWith(
                fontSize: FontSize.s18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppHeight.h16),
            // if (step.detail.runtimeType == StringData)
            //   Text(
            //     'Details: ${(step.detail as StringData).stringValue}',
            //     style: Theme.of(context).textTheme.titleSmall,
            //   )
            // else
            //   AudioPlayerWidget(
            //       audioPath: (step.detail as AudioData).audioFile.path),
            if (step.textDescription != null)
              Text(
                'Details: ${step.textDescription}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            if (step.audioDescription != null)
              AudioPlayerWidget(
                // audioPath: (step.data as AudioData).audioFile.path),
                audioPath: (step.audioDescription!.path),
              ),

            const SizedBox(height: AppHeight.h4),
            Text(
              'Status: ${HelperFunctions.humanizeString(step.status.name).capitalize()}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: AppHeight.h16),
            if (step.report != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Report Fields:',
                    style: const TextStyle()
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildReport(step.report!),
                ],
              ),
            if (step.status == RepairStepStatus.PENDING)
              SubmitButton(
                label: "Start the process".hardcoded(),
                onPressed: () async {
                  if (await ref
                      .read(repairProgressScreenControllerProvider.notifier)
                      .updateRepairStepStatus(repairRequestIdx, step.idx,
                          RepairStepStatus.IN_PROGRESS)) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            if (step.status == RepairStepStatus.IN_PROGRESS)
              SubmitButton(
                label: "Complete the process".hardcoded(),
                onPressed: () async {
                  bool updated = await ref
                      .read(repairProgressScreenControllerProvider.notifier)
                      .updateRepairStepStatus(
                        repairRequestIdx,
                        step.idx,
                        RepairStepStatus.COMPLETE,
                      );
                  if (updated) {
                    context.pop();
                    ToastHelper.showNotification(context,
                        "Step has been marked as complete.".hardcoded());
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buildReport(RepairStepReport report) {
  return Row(
    children: [
      Text(HelperFunctions.humanizeString("Bill images").capitalize()),
      Expanded(
        child: SingleChildScrollView(
          child: Row(
            children: [
              for (Map<String, String> image in report.billImages)
                _buildReportImage(image["image"]!),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildReportImage(String url) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
    child: SizedBox(
      width: AppWidth.h75,
      height: AppWidth.h200,
      child: url.startsWith('http') ? Image.network(url) : Image.asset(url),
    ),
  );
}
