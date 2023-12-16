import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step_report.dart';
import 'package:bato_mechanic/src/utils/constants/managers/api_values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/audio_widget.dart';
import '../../../../utils/constants/managers/font_manager.dart';
import '../../../../utils/constants/managers/style_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/data_types/string_or_audio.dart';
import '../../../../utils/enums/repair_setp_status.dart';
import '../../domain/repair_step.dart';
import '../screen/repair_progress_screen.dart';

class RepairStepBottomSheet extends StatelessWidget {
  const RepairStepBottomSheet({
    super.key,
    required this.step,
  });

  final RepairStep step;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(AppPadding.p16),
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
            if (step.detail.runtimeType == StringData)
              Text(
                'Details: ${(step.detail as StringData).stringValue}',
                style: Theme.of(context).textTheme.titleSmall,
              )
            else
              AudioPlayerWidget(
                  audioPath: (step.detail as AudioData).audioFile.path),
            const SizedBox(height: 16),
            Text(
              'Status: ${HelperFunctions.humanizeString(step.status.name).capitalize()}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            if (step.report != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Report Fields:',
                    style: TextStyle()
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildReport(step.report!),
                ],
              ),
            if (step.status == RepairStepStatus.PENDING)
              SubmitButton(
                  label: "Start the process".hardcoded(), onPressed: () {})
          ],
        ),
      ),
    );
  }
}

// Widget _buildReport(Map<String, dynamic> reportField) {
//   for (final entry in reportField.entries) {
//     if (entry.value is List) {
//       if (entry.key == "bill_images") {
//         return Row(
//           children: [
//             Text(HelperFunctions.humanizeString(entry.key).capitalize()),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Row(
//                   children: [
//                     for (final field in entry.value) _buildReportImage(field),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       }
//     } else {
//       return Container();
//     }
//   }
//   return Container();
// }
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
      child: Image.asset(url),
    ),
  );
}
