import 'dart:io';

import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/api_repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_repair_request_repository.dart';

part 'repair_request_repository.g.dart';

abstract class RepairRequestRepository {
  Future<VehicleRepairRequest> fetchVechicleRepairRequest(
      String repairRequestId);
  Future<VehicleRepairRequest> requestForVehicleRepair(
      Map<String, dynamic> requestInfo);
  Future<dynamic> addImagesToRepairRequest(
      String repairRequestId, List<File> images);
  Future<List<VehicleRepairRequest>> fetchUserRepairRequests();
  Future<List<VehicleRepairRequest>> fetchUserActiveRepairRequests();
  Future<List<VehicleRepairRequest>> fetchUserRecentRepairRequests();
  Future<VehicleRepairRequest> updateRepairRequest(
      String repairRequestId, Map<String, dynamic> requestInfo);
}

@riverpod
RepairRequestRepository repairRequestRepository(
        RepairRequestRepositoryRef ref) =>
    SHOW_FAKE
        ? FakeRepairRequestRepository()
        : APIRepairRequestRepository(ref: ref);

@riverpod
Future<List<VehicleRepairRequest>> fetchUserRepairRequest(
        FetchUserRepairRequestRef ref) =>
    ref.watch(repairRequestRepositoryProvider).fetchUserRepairRequests();

@riverpod
Future<VehicleRepairRequest> fetchVechicleRepairRequest(
        FetchVechicleRepairRequestRef ref, String repairRequestIdx) =>
    ref
        .watch(repairRequestRepositoryProvider)
        .fetchVechicleRepairRequest(repairRequestIdx);
