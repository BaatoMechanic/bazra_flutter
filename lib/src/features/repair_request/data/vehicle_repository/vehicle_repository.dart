import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_vehicle_repository.dart';

part 'vehicle_repository.g.dart';

abstract class VehicleRepository {
  Future<List<Vehicle>> fetchVehiclesByCategory(String categoryId);
  Future<List<Vehicle>> fetchAllVehicles();
}

@riverpod
VehicleRepository vehicleRepository(VehicleRepositoryRef ref) =>
    FakeVehicleRepository();

@riverpod
Future<List<Vehicle>> fetchVehiclesByCategory(
    FetchVehiclesByCategoryRef ref, String categoryId) {
  return ref
      .watch(vehicleRepositoryProvider)
      .fetchVehiclesByCategory(categoryId);
}
