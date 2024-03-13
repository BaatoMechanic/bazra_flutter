// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_step_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairStepReportImpl _$$RepairStepReportImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairStepReportImpl(
      idx: json['idx'] as String,
      billImages: (json['billImages'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$$RepairStepReportImplToJson(
        _$RepairStepReportImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'billImages': instance.billImages,
    };
