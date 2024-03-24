import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/auto_dispose_provider_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_repairs_list_controller.g.dart';

@riverpod
Future<List<VehicleRepairRequest>> fetchActiveRepairRequests(
    FetchActiveRepairRequestsRef ref) {
  ref.cache();
  return ref
      .watch(repairRequestRepositoryProvider)
      .fetchUserActiveRepairRequests();
}
