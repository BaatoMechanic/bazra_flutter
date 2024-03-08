// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/vehicle_part/domain/vehicle_part/vehicle_part.dart';

class VehiclePartsState {
  VehiclePartsState({
    this.vehicleParts = const AsyncValue.data([]),
    this.selectedPart,
  });
  final AsyncValue<List<VehiclePart>> vehicleParts;
  final VehiclePart? selectedPart;

  VehiclePartsState copyWith({
    AsyncValue<List<VehiclePart>>? vehicleParts,
    VehiclePart? selectedPart,
  }) {
    return VehiclePartsState(
      vehicleParts: vehicleParts ?? this.vehicleParts,
      selectedPart: selectedPart ?? this.selectedPart,
    );
  }

  @override
  String toString() =>
      'VehiclePartsState(vehicleParts: $vehicleParts, selectedPart: $selectedPart)';

  @override
  bool operator ==(covariant VehiclePartsState other) {
    if (identical(this, other)) return true;

    return other.vehicleParts == vehicleParts &&
        other.selectedPart == selectedPart;
  }

  @override
  int get hashCode => vehicleParts.hashCode ^ selectedPart.hashCode;
}
