// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import '../data/vehicle_category_repository.dart';

class VehicleCategoryService {
  VehicleCategoryService({
    required this.ref,
  });
  final Ref ref;
  // final _selectedVehicleCategoryState = InMemoryStore<VehicleCategory?>(null);

  // Stream<VehicleCategory?> _selectedVehicleCategoryStateChanges() =>
  //     _selectedVehicleCategoryState.stream;
  // VehicleCategory? get selectedVehicleCategory =>
  //     _selectedVehicleCategoryState.value;

  // void setSelectedCategory(VehicleCategory category) {
  //   _selectedVehicleCategoryState.value = category;
  // }

  Future<List<VehicleCategory>> fetchVehicleCategories() async {
    final response = await ref
        .watch(vehicleCategoryRepositoryProvider)
        .fetchVehicleCategories();

    if (response is Success) {
      return response.response as List<VehicleCategory>;
    }
    if (response is Failure) {
      throw Exception('Something went wrong'.hardcoded());
    }
    return [];
  }

  // void dispose() => _selectedVehicleCategoryState.close();
}

final vehicleCategoryServiceProvider = Provider((ref) {
  final serviceProvider = VehicleCategoryService(ref: ref);

  return serviceProvider;
});

// final watchSelectedVehicleCategoryProvider =
//     StreamProvider.autoDispose<VehicleCategory?>((ref) {
//   final serviceProvider = ref.watch(vehicleCategoryServiceProvider);
//   return serviceProvider._selectedVehicleCategoryStateChanges();
// });
