// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_repair_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleRepairRequestImpl _$$VehicleRepairRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleRepairRequestImpl(
      idx: json['idx'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      userIdx: json['user'] as String,
      vehicleCategoryIdx: json['vehicle_type'] as String,
      serviceTypeIdx: json['service_type'] as String,
      preferredMechanicIdx: json['preferred_mechanic'] as String?,
      assignedMechanicIdx: json['assigned_mechanic'] as String?,
      location: json['location'] as Map<String, dynamic>?,
      status: $enumDecode(_$VehicleRepairRequestStatusEnumMap, json['status']),
      advancePaymentStatus: $enumDecode(
          _$AdvancePaymentStatusEnumMap, json['advance_payment_status']),
      advanceCharge: (json['advance_charge'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$VehicleRepairRequestImplToJson(
        _$VehicleRepairRequestImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'title': instance.title,
      'description': instance.description,
      'user': instance.userIdx,
      'vehicle_type': instance.vehicleCategoryIdx,
      'service_type': instance.serviceTypeIdx,
      'preferred_mechanic': instance.preferredMechanicIdx,
      'assigned_mechanic': instance.assignedMechanicIdx,
      'location': instance.location,
      'status': _$VehicleRepairRequestStatusEnumMap[instance.status]!,
      'advance_payment_status':
          _$AdvancePaymentStatusEnumMap[instance.advancePaymentStatus]!,
      'advance_charge': instance.advanceCharge,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$VehicleRepairRequestStatusEnumMap = {
  VehicleRepairRequestStatus.PENDING: 'pending',
  VehicleRepairRequestStatus.WAITING_FOR_USER_ACCEPTANCE:
      'waiting_for_user_acceptance',
  VehicleRepairRequestStatus.WAITING_FOR_ADVANCE_PAYMENT:
      'waiting_for_advance_payment',
  VehicleRepairRequestStatus.WAITING_FOR_MECHANIC: 'waiting_for_mechanic',
  VehicleRepairRequestStatus.IN_PROGRESS: 'in_progress',
  VehicleRepairRequestStatus.HALT: 'halt',
  VehicleRepairRequestStatus.WAITING_FOR_COMPLETION_ACCEPTANCE:
      'waiting_for_completion_acceptance',
  VehicleRepairRequestStatus.COMPLETE: 'complete',
  VehicleRepairRequestStatus.CANCELLED: 'cancelled',
};

const _$AdvancePaymentStatusEnumMap = {
  AdvancePaymentStatus.PENDING: 'pending',
  AdvancePaymentStatus.COMPLETE: 'complete',
  AdvancePaymentStatus.PAYMENT_ON_ARRIVAL: 'payment_on_arrival',
};

_$VehicleRepairRequestImageImpl _$$VehicleRepairRequestImageImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleRepairRequestImageImpl(
      id: json['id'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$VehicleRepairRequestImageImplToJson(
        _$VehicleRepairRequestImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

_$VehicleRepairRequestVideoImpl _$$VehicleRepairRequestVideoImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleRepairRequestVideoImpl(
      id: json['id'] as int,
      video: json['video'] as String,
    );

Map<String, dynamic> _$$VehicleRepairRequestVideoImplToJson(
        _$VehicleRepairRequestVideoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
    };
