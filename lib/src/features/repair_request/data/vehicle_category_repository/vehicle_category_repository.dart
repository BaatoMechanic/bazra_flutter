import 'package:bato_mechanic/src/features/repair_request/data/vehicle_category_repository/fake_vehicle_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/vehicle_category.dart';

abstract class VehicleCategoryRepository {
  Future<dynamic> fetchVehicleCategories();
}

final vehicleCategoryRepositoryProvider =
    Provider((ref) => FakeVehicleCategoryRepository());

// final vehicleCategoryListFutureProvider = FutureProvider((ref) {
//   final vehicleCategoryRepository =
//       ref.watch(vehicleCategoryRepositoryProvider);
//   return vehicleCategoryRepository.fetchVehicleCategories();
// });
