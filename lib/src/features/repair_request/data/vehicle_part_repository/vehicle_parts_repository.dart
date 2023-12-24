import 'package:bato_mechanic/src/features/repair_request/data/vehicle_part_repository/fake_vehicle_parts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class VehiclePartsRepository {
  Future<dynamic> fetchVehicleParts(String categoryId);
}

final vehiclePartsRepositoryProvider =
    Provider((ref) => FakeVehiclePartsRepository());
