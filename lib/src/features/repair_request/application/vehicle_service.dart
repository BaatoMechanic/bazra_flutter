import 'package:bato_mechanic/src/features/repair_request/data/vehicle_repository/vehicle_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/vehicle/vehicle.dart';

part 'vehicle_service.g.dart';

class VehiclesService {
  VehiclesService({
    required this.ref,
  });
  final Ref ref;
}

@riverpod
VehiclesService vehicleService(VehicleServiceRef ref) =>
    VehiclesService(ref: ref);

@riverpod
Future<List<Vehicle>> fetchVehiclesByCategory(
    FetchVehiclesByCategoryRef ref, String categoryId) {
  return ref
      .watch(vehicleRepositoryProvider)
      .fetchVehiclesByCategory(categoryId);
}
