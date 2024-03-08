import 'dart:io';

import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';

import '../../../../utils/constants/test_vehicles.dart';
import '../../domain/vehicle/vehicle.dart';
import 'vehicle_repository.dart';

class FakeVehicleRepository implements VehicleRepository {
  @override
  Future<List<Vehicle>> fetchVehiclesByCategory(String categoryId) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Vehicle> vehicles = mTestVehicles
        .where((vehicle) => vehicle.category == int.parse(categoryId))
        .toList();
    return vehicles;
  }

  @override
  Future<List<Vehicle>> fetchAllVehicles() async {
    await Future.delayed(const Duration(seconds: 1));
    return mTestVehicles;
  }
}
