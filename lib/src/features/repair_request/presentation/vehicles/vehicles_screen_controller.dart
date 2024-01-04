import 'package:bato_mechanic/src/features/repair_request/application/vechicles_service.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehiclesScreenController
    extends StateNotifier<AsyncValue<List<Vehicle>>> {
  VehiclesScreenController({required this.ref})
      : super(
          const AsyncValue.data([]),
        );
  final Ref ref;

  Future<List<Vehicle>> fetchVehiclesByCategory(String categoryId) async {
    // state = AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.watch(vehicleServiceProvider).fetchCategoryVehicles(categoryId));
    return state.hasValue ? (state.value as List<Vehicle>) : [];
  }

  // void setSelectedVehicle(Vehicle vehicle) {
  //   ref.watch(vehicleServiceProvider).setSelectedVehicle(vehicle);
  // }
}

final vehiclesScreenControllerProvider = StateNotifierProvider.autoDispose<
    VehiclesScreenController, AsyncValue<List<Vehicle>>>(
  (ref) => VehiclesScreenController(ref: ref),
);

final fetchVehiclesProvider =
    FutureProvider.family.autoDispose<List<Vehicle>, String>((ref, categoryId) {
  final vehiclesScreenController =
      ref.watch(vehiclesScreenControllerProvider.notifier);
  return vehiclesScreenController.fetchVehiclesByCategory(categoryId);
});
