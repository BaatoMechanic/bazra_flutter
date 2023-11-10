// import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../data/vehicle_repository/vehicle_repository.dart';

// class VehiclesScreenController extends StateNotifier<VehiclesState> {
//   VehiclesScreenController({required this.ref})
//       : super(
//           VehiclesState(
//             vehicles: const AsyncValue.data([]),
//             selectedVehicle: null,
//           ),
//         );
//   final Ref ref;

//   Future<List<Vehicle>> fetchVehiclesByCategory(String categoryId) async {
//     final result = await AsyncValue.guard(() => ref
//         .watch(vehicleRepositoryProvider)
//         .fetchVehiclesByCategory(categoryId));
//     state = state.copyWith(vehicles: result);
//     return state.vehicles.value ?? [];
//   }

//   void setSelectedVehicle(Vehicle vehicle) {
//     state = state.copyWith(selectedVehicle: vehicle);
//   }
// }

// final vehiclesScreenControllerProvider =
//     StateNotifierProvider.autoDispose<VehiclesScreenController, VehiclesState>(
//   (ref) => VehiclesScreenController(ref: ref),
// );

// final fetchVehiclesProvider =
//     FutureProvider.family.autoDispose<List<Vehicle>, String>((ref, categoryId) {
//   final vehiclesScreenController =
//       ref.watch(vehiclesScreenControllerProvider.notifier);
//   return vehiclesScreenController.fetchVehiclesByCategory(categoryId);
// });
