import 'dart:io';

import 'package:bato_mechanic/src/features/core/domain/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/api_repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_repair_request_repository.dart';

abstract class RepairRequestRepository {
  Future<VehicleRepairRequest> fetchVechicleRepairRequest(
      String repairRequestId);
  Future<VehicleRepairRequest> requestForVehicleRepair(
      Map<String, dynamic> requestInfo);
  Future<dynamic> addImagesToRepairRequest(
      String repairRequestId, List<File> images);
  Future<List<VehicleRepairRequest>> fetchUserRepairRequest();
  Future<VehicleRepairRequest> updateRepairRequest(
      String repairRequestId, Map<String, dynamic> requestInfo);
  Future watchUsersLocation(String repairRequestId);
  // Stream<List<UserPosition>> watchUsersLocation(String repairRequestId);
}

final repairRequestRepositoryProvider =
    // Provider((ref) => FakeRepairRequestRepository());
    Provider((ref) => APIRepairRequestRepository(ref: ref));
