import 'package:bato_mechanic/src/features/vehicle_part/domain/vehicle_part/vehicle_part.dart';

import '../../../utils/constants/test_parts.dart';
import 'vehicle_parts_repository.dart';

class FakeVehiclePartsRepository implements VehiclePartsRepository {
  @override
  Future<List<VehiclePart>> fetchVehicleParts(String vehicleId) async {
    await Future.delayed(const Duration(seconds: 1));

    return mTestVehicleParts;
  }
}
