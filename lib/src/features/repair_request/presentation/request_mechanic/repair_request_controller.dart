import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepairRequestController extends StateNotifier<RepairRequestState> {
  RepairRequestController({required this.ref})
      : super(
          RepairRequestState(repairRequest: null),
        );
  final Ref ref;

  setRepairRequest(VehicleRepairRequest repairRequest) {
    state = state.copyWith(repairRequest: repairRequest);
  }
}

final repairRequestControllerProvider = StateNotifierProvider.autoDispose<
    RepairRequestController, RepairRequestState>(
  (ref) => RepairRequestController(ref: ref),
);
