import 'package:bato_mechanic/src/features/repair_request/application/providers.dart';
import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehicleCategoryScreenController
    extends StateNotifier<AsyncValue<List<VehicleCategory>>> {
  VehicleCategoryScreenController({required this.ref})
      : super(const AsyncValue.data([]));
  final Ref ref;

  void setSelectedCategory(VehicleCategory category) {
    ref.read(selectedVehicleCategoryProvider.notifier).state = category;
  }
}

final vehicleCategoryScreenControllerProvider =
    StateNotifierProvider.autoDispose<VehicleCategoryScreenController,
        AsyncValue<List<VehicleCategory>>>(
  (ref) => VehicleCategoryScreenController(ref: ref),
);
