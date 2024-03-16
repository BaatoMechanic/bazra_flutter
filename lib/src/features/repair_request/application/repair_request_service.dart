import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/vehicle_repair_request.dart';

part 'repair_request_service.g.dart';

@riverpod
class ActiveRepairRequest extends _$ActiveRepairRequest {
  @override
  VehicleRepairRequest? build() {
    return null;
  }

  void setActiveRepairRequest(VehicleRepairRequest request) {
    state = request;
  }
}

class RepairRequestService {
  RepairRequestService({
    required this.ref,
  });

  Ref ref;

  Future<VehicleRepairRequest> fetchUserRepairRequest() async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .fetchUserRepairRequest();

    ref
        .read(activeRepairRequestProvider.notifier)
        .setActiveRepairRequest(response.first);

    return response.first;
  }
}

@riverpod
RepairRequestService repairRequestService(RepairRequestServiceRef ref) =>
    RepairRequestService(ref: ref);
