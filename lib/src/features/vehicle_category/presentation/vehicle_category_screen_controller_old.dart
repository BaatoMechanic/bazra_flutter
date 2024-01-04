// import 'package:bato_mechanic/src/features/repair_request/application/vechicle_category_service.dart';
// import 'package:bato_mechanic/src/features/repair_request/data/vehicle_category_repository/vehicle_category_repository.dart';
// import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_categories/vehicle_category_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class VehicleCategoryScreenController
//     extends StateNotifier<VehicleCategoryState> {
//   VehicleCategoryScreenController({required this.ref})
//       : super(VehicleCategoryState(
//             vehicleCategories: AsyncValue.data([]), selectedCategory: null));
//   final Ref ref;

//   Future<List<VehicleCategory>> fetchVehicleCategories() async {
//     final result = await AsyncValue.guard(() =>
//         ref.watch(vehicleCategoryRepositoryProvider).fetchVehicleCategories());
//     // state.value!.vehicleCategories = result.value ?? [];
//     state = state.copyWith(vehicleCategories: result);
//     return state.vehicleCategories.value ?? [];
//   }

//   void setSelectedCategory(VehicleCategory category) {
//     state = state.copyWith(selectedCategory: category);
//   }
// }

// final vehicleCategoryScreenControllerProvider = StateNotifierProvider
//     .autoDispose<VehicleCategoryScreenController, VehicleCategoryState>(
//   (ref) => VehicleCategoryScreenController(ref: ref),
// );

// final fetchVehicleCategoriesProvideer =
//     FutureProvider.autoDispose<List<VehicleCategory>>((ref) {
//   final vehicleCategoryScreenController =
//       ref.watch(vehicleCategoryScreenControllerProvider.notifier);
//   return vehicleCategoryScreenController.fetchVehicleCategories();
// });
