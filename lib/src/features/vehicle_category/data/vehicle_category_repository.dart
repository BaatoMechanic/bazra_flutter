import 'package:bato_mechanic/src/features/vehicle_category/data/api_vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/vehicle_category/data/fake_vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category/vehicle_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../main.dart';
part "vehicle_category_repository.g.dart";

abstract class VehicleCategoryRepository {
  Future<List<VehicleCategory>> fetchVehicleCategories();
  Future<List<VehicleCategory>> fetchVehicleCategoriesForService(
      String serviceId);
}

@riverpod
VehicleCategoryRepository vehicleCategoryRepository(
        VehicleCategoryRepositoryRef ref) =>
    SHOW_FAKE
        ? FakeVehicleCategoryRepository()
        : APIVehicleCategoryRepository(ref: ref);
