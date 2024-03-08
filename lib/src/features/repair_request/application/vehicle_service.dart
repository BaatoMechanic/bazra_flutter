// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_repository/vehicle_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/vehicle/vehicle.dart';

part 'vehicle_service.g.dart';

class VehiclesService {
  VehiclesService({
    required this.ref,
  });
  final Ref ref;
  // final _selectedVehicleState = InMemoryStore<Vehicle?>(null);

  // Stream<Vehicle?> _selectedVehicleStateChanges() =>
  //     _selectedVehicleState.stream;
  // Vehicle? get selectedVehicle => _selectedVehicleState.value;

  // void setSelectedVehicle(Vehicle category) {
  //   _selectedVehicleState.value = category;
  // }

  // Future<List<Vehicle>> fetchCategoryVehicles(String categoryId) async {
  //   final response = await ref
  //       .watch(vehicleRepositoryProvider)
  //       .fetchVehiclesByCategory(categoryId);

  //   if (response is Success) {
  //     return response.response as List<Vehicle>;
  //   }
  //   if (response is Failure) {
  //     throw Exception('Something went wrong'.hardcoded());
  //   }
  //   return [];
  // }
}

@riverpod
VehiclesService vehicleService(VehicleServiceRef ref) =>
    VehiclesService(ref: ref);

@riverpod
Future<List<Vehicle>> fetchVehiclesByCategory(
    FetchVehiclesByCategoryRef ref, String categoryId) {
  return ref
      .watch(vehicleRepositoryProvider)
      .fetchVehiclesByCategory(categoryId);
}
