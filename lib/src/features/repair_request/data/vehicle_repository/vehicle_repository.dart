import 'package:bato_mechanic/src/features/repair_request/domain/vehicle/vehicle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_vehicle_repository.dart';

part 'vehicle_repository.g.dart';

abstract class VehicleRepository {
  Future<List<Vehicle>> fetchVehiclesByCategory(String categoryId);
  Future<List<Vehicle>> fetchAllVehicles();
}

// final vehicleRepositoryProvider = Provider((ref) => FakeVehicleRepository());

@riverpod
VehicleRepository vehicleRepository(VehicleRepositoryRef ref) =>
    FakeVehicleRepository();
