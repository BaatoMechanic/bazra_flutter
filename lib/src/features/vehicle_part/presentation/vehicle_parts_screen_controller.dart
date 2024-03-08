import 'package:bato_mechanic/src/features/repair_request/application/providers.dart';
import 'package:bato_mechanic/src/features/vehicle_part/application/vehicle_parts_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/vehicle_part/vehicle_part.dart';

class VehiclePartsScreenController
    extends StateNotifier<AsyncValue<List<VehiclePart>>> {
  VehiclePartsScreenController({required this.ref})
      : super(
          const AsyncValue.data([]),
        );
  final Ref ref;

  Future<List<VehiclePart>> fetchVehicleParts(String vehicleId) async {
    state = await AsyncValue.guard(() =>
        ref.watch(vehiclePartsServiceProvider).fetchVehicleParts(vehicleId));
    return state.hasValue ? (state.value as List<VehiclePart>) : [];
  }

  void setSelectedPart(VehiclePart vehiclePart) {
    // ref.read(vehiclePartsServiceProvider).setSelectedVehiclePart(vehiclePart);
    ref.read(selectedVehiclePartProvider.notifier).state = vehiclePart;
  }
}

final vehiclePartsScreenControllerProvider = StateNotifierProvider.autoDispose<
    VehiclePartsScreenController, AsyncValue<List<VehiclePart>>>(
  (ref) => VehiclePartsScreenController(ref: ref),
);

final fetchVehiclePartsProvider = FutureProvider.family
    .autoDispose<List<VehiclePart>, String>((ref, vehicleId) {
  final partsController =
      ref.watch(vehiclePartsScreenControllerProvider.notifier);
  return partsController.fetchVehicleParts(vehicleId);
});
