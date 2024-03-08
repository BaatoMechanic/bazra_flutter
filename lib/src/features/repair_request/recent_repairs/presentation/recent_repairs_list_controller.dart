import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_repairs_list_controller.g.dart';

// class RecentRepairsListScreenController
//     extends StateNotifier<AsyncValue<List<VehicleRepairRequest>>> {
//   RecentRepairsListScreenController(this._repository)
//       : super(const AsyncData([]));

//   final RepairRequestRepository _repository;

//   Future<List<VehicleRepairRequest>> fetchUserRecentRepairRequests() async {
//     state = await AsyncValue.guard(
//         () => _repository.fetchUserRecentRepairRequests());

//     return state.value as List<VehicleRepairRequest>;
//   }
// }

// final recentRepairsListScreenControllerProvider = StateNotifierProvider<
//     RecentRepairsListScreenController,
//     AsyncValue<List<VehicleRepairRequest>>>((ref) {
//   return RecentRepairsListScreenController(
//       ref.watch(repairRequestRepositoryProvider));
// });

@riverpod
Future<List<VehicleRepairRequest>> fetchUserRecentRepairRequests(
        FetchUserRecentRepairRequestsRef ref) =>
    ref.watch(repairRequestRepositoryProvider).fetchUserRecentRepairRequests();
