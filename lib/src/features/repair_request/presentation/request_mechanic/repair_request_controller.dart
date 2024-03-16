import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repair_request_controller.g.dart';

@riverpod
class RepairRequestController extends _$RepairRequestController {
  @override
  FutureOr<VehicleRepairRequest?> build() {
    return null;
  }

  void setRepairRequest(VehicleRepairRequest repairRequest) {
    state = AsyncData(repairRequest);
  }
}
