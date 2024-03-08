import 'package:bato_mechanic/src/features/repair_request/application/providers.dart';
import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category/vehicle_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_category_screen_controller.g.dart';

@riverpod
class VehicleCategoryScreenController
    extends _$VehicleCategoryScreenController {
  @override
  AsyncValue<List<VehicleCategory>> build() {
    return const AsyncValue.data([]);
  }

  void setSelectedCategory(VehicleCategory category) {
    ref
        .read(selectedVehicleCategoryProvider.notifier)
        .setSelectedCategory(category);
  }
}
