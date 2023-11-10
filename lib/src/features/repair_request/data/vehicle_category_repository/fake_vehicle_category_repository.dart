import 'dart:io';

import 'package:bato_mechanic/src/constants/test_categories.dart';
import 'package:bato_mechanic/src/constants/test_vehicles.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_category_repository/vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';

class FakeVehicleCategoryRepository implements VehicleCategoryRepository {
  @override
  Future<dynamic> fetchVehicleCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    // return Future.value(mTestCategories);
    return Success(code: HttpStatus.ok, response: mTestCategories);
  }
}
