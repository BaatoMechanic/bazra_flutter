import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_step_report.freezed.dart';
part 'repair_step_report.g.dart';

@freezed
class RepairStepReport with _$RepairStepReport {
  const factory RepairStepReport({
    required String idx,
    required List<Map<String, String>> billImages,
  }) = _RepairStepReport;

  factory RepairStepReport.fromJson(Map<String, dynamic> json) =>
      _$RepairStepReportFromJson(json);
}

List<Map<String, String>> billImagesFromJson(List<dynamic> json) {
  return List<Map<String, String>>.from(
    json.map<Map<String, String>>((x) => {
          'idx': x['idx'],
          'image': x['image'],
        }),
  );
}
