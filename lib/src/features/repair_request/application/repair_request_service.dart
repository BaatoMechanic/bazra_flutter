// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/vehicle_repair_request/vehicle_repair_request.dart';

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

  // Stream<UserPosition?> watchUsersLocation(String repairRequestId) {
  //   var locations = ref
  //       .read(repairRequestRepositoryProvider)
  //       .watchUsersLocation(repairRequestId);

  //   return Stream.empty();
  // }

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

    ref
        .read(activeRepairRequestProvider.notifier)
        .setActiveRepairRequest(response.first);

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

@riverpod
RepairRequestService repairRequestService(RepairRequestServiceRef ref) =>
    RepairRequestService(ref: ref);

final fetchUserRepairRequestProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(repairRequestServiceProvider).fetchUserRepairRequest());

@riverpod
Future<VehicleRepairRequest> fetchVechicleRepairRequest(
        FetchVechicleRepairRequestRef ref, String repairRequestIdx) =>
    ref
        .watch(repairRequestRepositoryProvider)
        .fetchVechicleRepairRequest(repairRequestIdx);
