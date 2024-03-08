import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repair_request_controller.g.dart';

@riverpod
class RepairRequestController extends _$RepairRequestController {
  @override
  FutureOr<VehicleRepairRequest?> build() {
    // pass
  }

  void setRepairRequest(VehicleRepairRequest repairRequest) {
    state = AsyncData(repairRequest);
  }
}
