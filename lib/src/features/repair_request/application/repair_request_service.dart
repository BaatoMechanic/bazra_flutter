// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/core/domain/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/fake_repair_request_repository.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:http/http.dart';

import '../../../utils/model_utils.dart';
import '../domain/vehicle_repair_request.dart';

final activeRepairRequestProvider =
    StateProvider<VehicleRepairRequest?>((ref) => null);

class RepairRequestService {
  RepairRequestService({
    required this.ref,
  });

  Ref ref;

  Stream<UserPosition?> watchUsersLocation(String repairRequestId) {
    var locations = ref
        .read(repairRequestRepositoryProvider)
        .watchUsersLocation(repairRequestId);

    return Stream.empty();
  }

  Future<VehicleRepairRequest> createVehicleRepairRequest(
      Map<String, dynamic> requestInfo) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .requestForVehicleRepair(requestInfo);

    return response;
  }

  Future<VehicleRepairRequest> fetchUserRepairRequest() async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .fetchUserRepairRequest();

    ref.read(activeRepairRequestProvider.notifier).state = response.first;

    return response.first;
  }

  Future<VehicleRepairRequest> updateVehicleRepairRequest(
      String requestId, Map<String, dynamic> requestInfo) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .updateRepairRequest(requestId, requestInfo);

    return response;
  }

  Future<VehicleRepairRequest> addImagesToVechicleRepairRequest(
      String requestId, List<File> images) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .addImagesToRepairRequest(requestId, images);
    return response;
  }
}

final repairRequestServiceProvider = Provider((ref) {
  return RepairRequestService(ref: ref);
});

final fetchUserRepairRequestProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(repairRequestServiceProvider).fetchUserRepairRequest());

final fetchRepairRequestProvider = FutureProvider.autoDispose
    .family<VehicleRepairRequest, String>((ref, repairRequestIdx) {
  return ref
      .watch(repairRequestRepositoryProvider)
      .fetchVechicleRepairRequest(repairRequestIdx);
});
