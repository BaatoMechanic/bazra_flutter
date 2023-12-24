// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/data/repair_request_repository/repair_request_repository.dart';
import 'package:http/http.dart';

import '../../../utils/model_utils.dart';
import '../domain/vehicle_repair_request.dart';

class RepairRequestService {
  RepairRequestService({
    required this.ref,
  });

  final _repairRequestState = InMemoryStore<VehicleRepairRequest?>(null);
  Ref ref;

  Stream<VehicleRepairRequest?> _repairRequestStateChanges() =>
      _repairRequestState.stream;
  VehicleRepairRequest? get activeRepairRequest => _repairRequestState.value;

  void setActiveRepairRequest(VehicleRepairRequest? request) {
    _repairRequestState.value = request;
  }

  Future<dynamic> createVehicleRepairRequest(
      Map<String, dynamic> requestInfo) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .requestForVehicleRepair(requestInfo);

    if (response is Success) {
      VehicleRepairRequest repairRequest = VehicleRepairRequest.fromJson(
          jsonDecode((response.response as Response).body.toString()));
      return repairRequest;
    }
    return false;
    // return response;
  }

  Future<dynamic> updateVehicleRepairRequest(
      String requestId, Map<String, dynamic> requestInfo) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .updateRepairRequest(requestId, requestInfo);
    if (response is Success) {
      VehicleRepairRequest repairRequest = VehicleRepairRequest.fromJson(
          jsonDecode((response.response as String)));
      setActiveRepairRequest(repairRequest);
      return repairRequest;
    }
    return false;
  }

  Future<dynamic> addImagesToVechicleRepairRequest(
      String requestId, List<File> images) async {
    var response = await ref
        .read(repairRequestRepositoryProvider)
        .addImagesToRepairRequest(requestId, images);
    if (response is Success) {
      VehicleRepairRequest repairRequest = VehicleRepairRequest.fromJson(
          jsonDecode((response.response as Response).body.toString()));
      _repairRequestState.value = repairRequest;
      return repairRequest;
    }
    if (response is Failure) {
      throw Exception("Couldn't add Images");
    }
    return response;
  }

  fetchUserRepairRequests() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await ref
        .read(repairRequestRepositoryProvider)
        .fetchUserRepairRequest();
    if (response is Success) {
      List<VehicleRepairRequest> repairRequests =
          vehicleRepairRequestsFromJson((response.response as Response).body);
      // if (repairRequests.isEmpty) return false;
      if (repairRequests.isNotEmpty) {
        setActiveRepairRequest(repairRequests.last);
      } else {
        setActiveRepairRequest(null);
      }

      // return true;
    }
    if (response is Failure) {
      if (response.code == 404) {
        setActiveRepairRequest(null);
      } else {
        throw Exception(jsonDecode(response.errorResponse as String)['detail']);
        // return;
      }
    }
    print('here');
    // return false;
  }

  void dispose() => _repairRequestState.close();
}

final repairRequestServiceProvider = Provider((ref) {
  final serviceProvider = RepairRequestService(ref: ref);
  ref.onDispose(() => serviceProvider.dispose());
  return serviceProvider;
});

final watchRepairRequestStateChangesProvider = StreamProvider((ref) {
  final serviceProvider = ref.watch(repairRequestServiceProvider);
  return serviceProvider._repairRequestStateChanges();
});
