import 'package:bato_mechanic/src/utils/enums/repair_setp_status.dart';

import '../../../utils/data_types/string_or_audio.dart';
import '../repair_progress_screen.dart';
import 'repair_step_report.dart';

class RepairStep {
  final String name;
  // final String detail;
  final StringOrAudio detail;
  final RepairStepStatus status;
  final RepairStepReport? report;

  RepairStep({
    required this.name,
    required this.detail,
    required this.status,
    this.report,
  });
}
