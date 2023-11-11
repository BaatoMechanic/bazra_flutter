import 'dart:io';

import 'package:bato_mechanic/src/utils/model_utils.dart';

import '../../../../utils/constants/test_vehicles.dart';
import '../../domain/vehicle.dart';
import 'vehicle_repository.dart';

class FakeVehicleRepository implements VehicleRepository {
  @override
  Future<dynamic> fetchVehiclesByCategory(String categoryId) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Vehicle> vehicles = mTestVehicles
        .where((vehicle) => vehicle.category == int.parse(categoryId))
        .toList();
    return Success(code: HttpStatus.ok, response: vehicles);
  }
}
