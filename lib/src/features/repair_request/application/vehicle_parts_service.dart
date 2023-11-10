// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_part_repository/vehicle_parts_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_repository/vehicle_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import '../data/vehicle_category_repository/vehicle_category_repository.dart';
import '../domain/vehicle.dart';
import '../domain/vehicle_part.dart';

class VehiclePartsService {
  VehiclePartsService({
    required this.ref,
  });
  final _selectedVehiclePartState = InMemoryStore<VehiclePart?>(null);
  final Ref ref;

  Stream<VehiclePart?> _selectedVehiclePartStateChanges() =>
      _selectedVehiclePartState.stream;
  VehiclePart? get selectedVehiclePart => _selectedVehiclePartState.value;

  void setSelectedVehiclePart(VehiclePart part) {
    _selectedVehiclePartState.value = part;
  }

  Future<List<VehiclePart>> fetchVehicleParts(String vehicleId) async {
    final response = await ref
        .watch(vehiclePartsRepositoryProvider)
        .fetchVehicleParts(vehicleId);

    if (response is Success) {
      return response.response as List<VehiclePart>;
    }
    if (response is Failure) {
      throw Exception('Something went wrong'.hardcoded());
    }
    return [];
  }

  void dispose() => _selectedVehiclePartState.close();
}

final vehiclePartsServiceProvider = Provider((ref) {
  final serviceProvider = VehiclePartsService(ref: ref);
  ref.onDispose(() => serviceProvider.dispose());
  return serviceProvider;
});

final watchSelectedVehiclePartsProvider = StreamProvider<VehiclePart?>((ref) {
  final serviceProvider = ref.watch(vehiclePartsServiceProvider);
  return serviceProvider._selectedVehiclePartStateChanges();
});
