import 'package:bato_mechanic/src/features/vehicle_category/data/fake_vehicle_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
