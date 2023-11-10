import 'package:bato_mechanic/src/features/repair_request/application/vechicle_category_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_category_repository/vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_categories/vehicle_category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehicleCategoryScreenController
    extends StateNotifier<AsyncValue<List<VehicleCategory>>> {
  VehicleCategoryScreenController({required this.ref})
      : super(AsyncValue.data([]));
  final Ref ref;

  Future<List<VehicleCategory>> fetchVehicleCategories() async {
    // state = AsyncValue.loading();
    state = await AsyncValue.guard(() =>
        ref.watch(vehicleCategoryServiceProvider).fetchVehicleCategories());
    return state.hasValue ? (state.value as List<VehicleCategory>) : [];
  }

  void setSelectedCategory(VehicleCategory category) {
    ref.watch(vehicleCategoryServiceProvider).setSelectedCategory(category);
  }
}

final vehicleCategoryScreenControllerProvider =
    StateNotifierProvider.autoDispose<VehicleCategoryScreenController,
        AsyncValue<List<VehicleCategory>>>(
  (ref) => VehicleCategoryScreenController(ref: ref),
);

final fetchVehicleCategoriesProvideer = FutureProvider.autoDispose((ref) {
  final vehicleCategoryScreenController =
      ref.watch(vehicleCategoryScreenControllerProvider.notifier);
  return vehicleCategoryScreenController.fetchVehicleCategories();
});
