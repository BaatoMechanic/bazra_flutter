// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/vehicle_part/data/vehicle_parts_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import '../domain/vehicle_part.dart';

class VehiclePartsService {
  VehiclePartsService({
    required this.ref,
  });
  final Ref ref;
  // final _selectedVehiclePartState = InMemoryStore<VehiclePart?>(null);

  // Stream<VehiclePart?> _selectedVehiclePartStateChanges() =>
  //     _selectedVehiclePartState.stream;
  // VehiclePart? get selectedVehiclePart => _selectedVehiclePartState.value;

  // void setSelectedVehiclePart(VehiclePart part) {
  //   _selectedVehiclePartState.value = part;
  // }

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
}

final vehiclePartsServiceProvider = Provider((ref) {
  final serviceProvider = VehiclePartsService(ref: ref);
  return serviceProvider;
});

// final watchSelectedVehiclePartsProvider = StreamProvider<VehiclePart?>((ref) {
//   final serviceProvider = ref.watch(vehiclePartsServiceProvider);
//   return serviceProvider._selectedVehiclePartStateChanges();
// });
