// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle/vehicle.dart';

class VehiclesState {
  VehiclesState({
    this.vehicles = const AsyncValue.data([]),
    this.selectedVehicle,
  });
  final AsyncValue<List<Vehicle>> vehicles;
  final Vehicle? selectedVehicle;

  VehiclesState copyWith({
    AsyncValue<List<Vehicle>>? vehicles,
    Vehicle? selectedVehicle,
  }) {
    return VehiclesState(
      vehicles: vehicles ?? this.vehicles,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
    );
  }

  @override
  String toString() =>
      'VehiclesState(vehicles: $vehicles, selectedVehicle: $selectedVehicle)';

  @override
  bool operator ==(covariant VehiclesState other) {
    if (identical(this, other)) return true;

    return other.vehicles == vehicles &&
        other.selectedVehicle == selectedVehicle;
  }

  @override
  int get hashCode => vehicles.hashCode ^ selectedVehicle.hashCode;
}
