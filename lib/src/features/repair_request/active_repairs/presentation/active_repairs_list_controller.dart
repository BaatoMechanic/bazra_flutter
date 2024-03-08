import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_repairs_list_controller.g.dart';

@riverpod
Future<List<VehicleRepairRequest>> fetchActiveRepairRequests(
        FetchActiveRepairRequestsRef ref) =>
    ref.watch(repairRequestRepositoryProvider).fetchUserActiveRepairRequest();
