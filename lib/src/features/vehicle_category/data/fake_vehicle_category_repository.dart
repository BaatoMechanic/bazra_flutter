import 'dart:io';

import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/constants/test_categories.dart';
import 'package:bato_mechanic/src/features/vehicle_category/data/vehicle_category_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';

class FakeVehicleCategoryRepository implements VehicleCategoryRepository {
  @override
  Future<List<VehicleCategory>> fetchVehicleCategories() async {
    await Future.delayed(const Duration(seconds: 1));

    return mTestCategories;
  }

  @override
  Future<List<VehicleCategory>> fetchVehicleCategoriesForService(
      String serviceId) async {
    await Future.delayed(const Duration(seconds: 1));

    return mTestCategories;
  }
}
