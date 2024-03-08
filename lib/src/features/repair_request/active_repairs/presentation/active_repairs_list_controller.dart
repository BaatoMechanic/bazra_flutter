import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActiveRepairsListScreenController
    extends StateNotifier<AsyncValue<List<VehicleRepairRequest>>> {
  ActiveRepairsListScreenController(this._repository)
      : super(const AsyncData([]));

  final RepairRequestRepository _repository;

  Future<List<VehicleRepairRequest>> fetchUserActiveRepairRequests() async {
    state = await AsyncValue.guard(
        () => _repository.fetchUserActiveRepairRequest());

    return state.value as List<VehicleRepairRequest>;
  }
}

final activeRepairsListScreenControllerProvider = StateNotifierProvider<
    ActiveRepairsListScreenController,
    AsyncValue<List<VehicleRepairRequest>>>((ref) {
  return ActiveRepairsListScreenController(
      ref.watch(repairRequestRepositoryProvider));
});

final fetchUserActiveRepairRequests = FutureProvider((ref) => ref
    .watch(activeRepairsListScreenControllerProvider.notifier)
    .fetchUserActiveRepairRequests());
