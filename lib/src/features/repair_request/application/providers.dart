import 'package:bato_mechanic/src/features/services/domain/service/service.dart';
import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category/vehicle_category.dart';
import 'package:bato_mechanic/src/features/vehicle_part/domain/vehicle_part/vehicle_part.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedVehicleCategoryProvider =
    StateProvider<VehicleCategory?>((ref) => null);

final selectedVehiclePartProvider = StateProvider<VehiclePart?>((ref) => null);

final selectedServiceProvider = StateProvider<Service?>((ref) => null);
