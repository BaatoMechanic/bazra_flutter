import 'package:bato_mechanic/src/features/vehicle_category/data/api_vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/vehicle_category/data/fake_vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';

abstract class VehicleCategoryRepository {
  Future<List<VehicleCategory>> fetchVehicleCategories();
  Future<List<VehicleCategory>> fetchVehicleCategoriesForService(
      String serviceId);
}

final vehicleCategoryRepositoryProvider = Provider((ref) {
  if (SHOW_FAKE) {
    return FakeVehicleCategoryRepository();
  }
  return APIVehicleCategoryRepository(ref: ref);
});
