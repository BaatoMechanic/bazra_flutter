// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairStepImpl _$$RepairStepImplFromJson(Map<String, dynamic> json) =>
    _$RepairStepImpl(
      idx: json['idx'] as String,
      name: json['name'] as String,
      textDescription: json['textDescription'] as String?,
      audioDescription:
          const FileConverter().fromJson(json['audioDescription'] as String?),
      status: $enumDecode(_$RepairStepStatusEnumMap, json['status']),
      report: json['report'] == null
          ? null
          : RepairStepReport.fromJson(json['report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RepairStepImplToJson(_$RepairStepImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'name': instance.name,
      'textDescription': instance.textDescription,
      'audioDescription':
          const FileConverter().toJson(instance.audioDescription),
      'status': _$RepairStepStatusEnumMap[instance.status]!,
      'report': instance.report,
    };

const _$RepairStepStatusEnumMap = {
  RepairStepStatus.PENDING: 'pending',
  RepairStepStatus.IN_PROGRESS: 'in_progress',
  RepairStepStatus.COMPLETE: 'completed',
  RepairStepStatus.CANCELLED: 'cancelled',
};
