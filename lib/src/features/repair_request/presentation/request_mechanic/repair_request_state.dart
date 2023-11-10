// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';

class RepairRequestState {
  RepairRequestState({
    required this.repairRequest,
    this.value = const AsyncData(null),
  });
  final VehicleRepairRequest? repairRequest;
  final AsyncValue<void> value;

  RepairRequestState copyWith({
    VehicleRepairRequest? repairRequest,
    AsyncValue<void>? value,
  }) {
    return RepairRequestState(
      repairRequest: repairRequest ?? this.repairRequest,
      value: value ?? this.value,
    );
  }

  @override
  String toString() =>
      'RepairRequestState(repairRequest: $repairRequest, value: $value)';

  @override
  bool operator ==(covariant RepairRequestState other) {
    if (identical(this, other)) return true;

    return other.repairRequest == repairRequest && other.value == value;
  }

  @override
  int get hashCode => repairRequest.hashCode ^ value.hashCode;
}
