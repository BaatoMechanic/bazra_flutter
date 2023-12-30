import 'dart:io';

import 'package:bato_mechanic/src/features/repair_request/data/repair_request_repository/api_repair_request_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RepairRequestRepository {
  Future<dynamic> fetchVechicleRepairRequest(String repairRequestId);
  Future<dynamic> requestForVehicleRepair(Map<String, dynamic> requestInfo);
  Future<dynamic> addImagesToRepairRequest(
      String repairRequestId, List<File> images);
  Future<dynamic> fetchUserRepairRequest();
  Future<dynamic> updateRepairRequest(
      String repairRequestId, Map<String, dynamic> requestInfo);
  Future<dynamic> watchUsersLocation(String repairRequestId);
}

final repairRequestRepositoryProvider =
    // Provider((ref) => FakeRepairRequestRepository());
    Provider((ref) => APIRepairRequestRepository(ref: ref));
