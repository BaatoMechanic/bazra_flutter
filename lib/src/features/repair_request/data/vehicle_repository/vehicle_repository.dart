import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_vehicle_repository.dart';

abstract class VehicleRepository {
  Future<dynamic> fetchVehiclesByCategory(String categoryId);
}

final vehicleRepositoryProvider = Provider((ref) => FakeVehicleRepository());
