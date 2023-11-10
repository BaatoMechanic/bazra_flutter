import 'dart:io';

import 'package:bato_mechanic/src/utils/model_utils.dart';

import '../../../../constants/test_parts.dart';
import '../../domain/vehicle_part.dart';
import 'vehicle_parts_repository.dart';

class FakeVehiclePartsRepository implements VehiclePartsRepository {
  @override
  Future<dynamic> fetchVehicleParts(String vehicleId) async {
    await Future.delayed(const Duration(seconds: 1));
    List<VehiclePart> vehicleParts = mTestVehicleParts
        .where((vehiclePart) => vehiclePart.vehicleId == int.parse(vehicleId))
        .toList();
    return Success(code: HttpStatus.ok, response: vehicleParts);
  }
}
