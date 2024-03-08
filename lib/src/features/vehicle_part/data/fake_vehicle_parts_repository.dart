// import 'dart:io';

// import 'package:bato_mechanic/src/utils/model_utils.dart';

// import '../../../../utils/constants/test_parts.dart';
// import '../../domain/vehicle_part.dart';
// import 'vehicle_parts_repository.dart';

// class FakeVehiclePartsRepository implements VehiclePartsRepository {
//   @override
//   Future<dynamic> fetchVehicleParts(String vehicleId) async {
//     await Future.delayed(const Duration(seconds: 1));
//     List<VehiclePart> vehicleParts = mTestVehicleParts
//         .where((vehiclePart) => vehiclePart.vehicleId == int.parse(vehicleId))
//         .toList();
//     return Success(code: HttpStatus.ok, response: vehicleParts);
//   }
// }

import 'dart:io';

import 'package:bato_mechanic/src/features/vehicle_part/domain/vehicle_part/vehicle_part.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';

import '../../../utils/constants/test_parts.dart';
import 'vehicle_parts_repository.dart';

class FakeVehiclePartsRepository implements VehiclePartsRepository {
  @override
  Future<List<VehiclePart>> fetchVehicleParts(String vehicleId) async {
    await Future.delayed(const Duration(seconds: 1));

    return mTestVehicleParts;
  }
}
