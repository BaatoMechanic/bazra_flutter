// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_repository/vehicle_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import '../data/vehicle_category_repository/vehicle_category_repository.dart';
import '../domain/vehicle.dart';

class VehiclesService {
  VehiclesService({
    required this.ref,
  });
  final _selectedVehicleState = InMemoryStore<Vehicle?>(null);
  final Ref ref;

  Stream<Vehicle?> _selectedVehicleStateChanges() =>
      _selectedVehicleState.stream;
  Vehicle? get selectedVehicle => _selectedVehicleState.value;

  void setSelectedVehicle(Vehicle category) {
    _selectedVehicleState.value = category;
  }

  Future<List<Vehicle>> fetchCategoryVehicles(String categoryId) async {
    final response = await ref
        .watch(vehicleRepositoryProvider)
        .fetchVehiclesByCategory(categoryId);

    if (response is Success) {
      return response.response as List<Vehicle>;
    }
    if (response is Failure) {
      throw Exception('Something went wrong'.hardcoded());
    }
    return [];
  }

  void dispose() => _selectedVehicleState.close();
}

final vehicleServiceProvider = Provider((ref) {
  final serviceProvider = VehiclesService(ref: ref);
  ref.onDispose(() => serviceProvider.dispose());
  return serviceProvider;
});

final watchSelectedVehicleProvider = StreamProvider<Vehicle?>((ref) {
  final serviceProvider = ref.watch(vehicleServiceProvider);
  return serviceProvider._selectedVehicleStateChanges();
});
