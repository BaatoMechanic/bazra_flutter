import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repair_request_repository.dart';

class FakeRepairRequestRepository implements RepairRequestRepository {
  // final _repairRequestState = InMemoryStore<VehicleRepairRequest?>(null);
  // Stream<VehicleRepairRequest?> _repairRequestStateChanges() =>
  //     _repairRequestState.stream;
  // VehicleRepairRequest? get activeRepairRequest => _repairRequestState.value;

  // void setActiveRepairRequest(VehicleRepairRequest? request) {
  //   _repairRequestState.value = request;
  // }

  // void dispose() => _repairRequestState.close();

  @override
  Future<VehicleRepairRequest> requestForVehicleRepair(
      Map<String, dynamic> requestInfo) async {
    Map<String, dynamic> responseBody = {
      "id": 2,
      "customer": 1,
      "location_name":
          "Paneku Marg, Paneku Tol, Chabahil, Kathmandu-07, Kathmandu, Kathmandu Metropolitan City, Kathmandu, Bagmati Province, 44660, Nepal",
      "location_coordinates": "27.70862555398949,85.33758702603099",
      "vehicle": 1,
      "vehicle_part": 1,
      "description": "ggrv byffgkj",
      "images": [],
      "videos": [],
      // "status": "IN_PROGRESS",
      // "status": "WAITING_FOR_MECHANIC",
      "status": "WAITING_FOR_ADVANCE_PAYMENT",
      "created_at": "2023-10-05T17:19:44.893829Z"
    };

    await Future.delayed(const Duration(seconds: 2));
    return VehicleRepairRequest.fromJson(responseBody);
  }

  @override
  Future addImagesToRepairRequest(
      String repairRequestId, List<File> images) async {
    final response = VehicleRepairRequest.fromJson({
      "id": 2,
      "customer": 1,
      "location_name":
          "Paneku Marg, Paneku Tol, Chabahil, Kathmandu-07, Kathmandu, Kathmandu Metropolitan City, Kathmandu, Bagmati Province, 44660, Nepal",
      "location_coordinates": "27.70862555398949,85.33758702603099",
      "vehicle": 1,
      "vehicle_part": 1,
      "description": "ggrv byffgkj",
      "images": [
        {
          "id": 1,
          "image":
              "http://192.168.1.76:8000/media/store/images/repair_request/images/scaled_1000010809.jpg"
        },
        {
          "id": 2,
          "image":
              "http://192.168.1.76:8000/media/store/images/repair_request/images/scaled_1000010816.jpg"
        },
        {
          "id": 3,
          "image":
              "http://192.168.1.76:8000/media/store/images/repair_request/images/scaled_1000010817.jpg"
        },
        {
          "id": 4,
          "image":
              "http://192.168.1.76:8000/media/store/images/repair_request/images/scaled_1000010803.jpg"
        }
      ],
      "videos": [],
      "status": "IN_PROGRESS",
      "created_at": "2023-10-05T17:19:44.893829Z"
    });

    await Future.delayed(const Duration(seconds: 2));
    return response;
  }

  @override
  Future<VehicleRepairRequest> fetchVechicleRepairRequest(
      String repairRequestId) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => VehicleRepairRequest.fromJson({
        "idx": "NqCYPG6oX2jrjsePXZg42Z",
        "title": "Bike is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "assigned_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "service_type": "4ebFHe3UfuBLr9WbEroijH",
        // "status": "complete"
        "status": "waiting_for_completion_acceptance",
        "advance_payment_status": "pending",
        "created_at": "2023-10-05T17:19:44.893829Z"
      }),
    );
  }

  @override
  Future<List<VehicleRepairRequest>> fetchUserRepairRequest() async {
    // Response response = Response(jsonEncode([]), HttpStatus.ok);
    final response = jsonEncode([
      {
        "idx": "8aMD5vyNQZqpySEm9T38Y2",
        "title": "Car is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "preferred_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "assigned_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "service_type": "4ebFHe3UfuBLr9WbEroijH",
        "advance_payment_status": "pending",
        // "status": "waiting_for_advance_payment"
        "status": "waiting_for_completion_acceptance",
        "created_at": "2023-10-05T17:19:44.893829Z"
        // "status": "pending"
      },
      {
        "idx": "5xBBkkGbKTwEzuAkX46K8H",
        "title": "Car is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "preferred_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "advance_payment_status": "pending",
        // "assigned_mechanic": null,
        "service_type": "4ebFHe3UfuBLr9WbEroijH",
        "assigned_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "status": "waiting_for_completion_acceptance",
        "created_at": "2023-10-05T17:19:44.893829Z"
      },
    ]);

    await Future.delayed(const Duration(seconds: 1));
    return vehicleRepairRequestsFromJson(response);
  }

  @override
  Future<List<VehicleRepairRequest>> fetchUserActiveRepairRequest() async {
    // Response response = Response(jsonEncode([]), HttpStatus.ok);
    final response = jsonEncode([
      {
        "idx": "8aMD5vyNQZqpySEm9T38Y2",
        "title": "Car is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "preferred_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "assigned_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        // "status": "waiting_for_advance_payment"
        "status": "waiting_for_completion_acceptance",
        "advance_payment_status": "pending",
        "created_at": "2023-10-05T17:19:44.893829Z"
        // "status": "pending"
      },
      {
        "idx": "5xBBkkGbKTwEzuAkX46K8H",
        "title": "Car is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "preferred_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "advance_payment_status": "pending",
        // "assigned_mechanic": null,
        "assigned_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "status": "waiting_for_completion_acceptance",
        "created_at": "2023-10-05T17:19:44.893829Z"
      },
    ]);

    await Future.delayed(const Duration(seconds: 1));
    return vehicleRepairRequestsFromJson(response);
  }

  @override
  Future<List<VehicleRepairRequest>> fetchUserRecentRepairRequest() async {
    // Response response = Response(jsonEncode([]), HttpStatus.ok);
    final response = jsonEncode([
      {
        "idx": "8aMD5vyNQZqpySEm9T38Y2",
        "title": "Car is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "preferred_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "assigned_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        // "status": "waiting_for_advance_payment"
        "status": "waiting_for_completion_acceptance",
        "advance_payment_status": "pending",
        "created_at": "2023-10-05T17:19:44.893829Z"

        // "status": "pending"
      },
      {
        "idx": "5xBBkkGbKTwEzuAkX46K8H",
        "title": "Car is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "preferred_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "advance_payment_status": "pending",
        // "assigned_mechanic": null,
        "assigned_mechanic": "4ebFHe3UfuBLr9WbEroijH",
        "status": "waiting_for_completion_acceptance",
        "created_at": "2023-10-05T17:19:44.893829Z"
      },
    ]);

    await Future.delayed(const Duration(seconds: 1));
    return vehicleRepairRequestsFromJson(response);
  }

  @override
  Future<VehicleRepairRequest> updateRepairRequest(
      String repairRequestId, Map<String, dynamic> requestInfo) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => VehicleRepairRequest.fromJson({
        "idx": "NqCYPG6oX2jrjsePXZg42Z",
        "title": "Bike is not startingg",
        "description":
            "The engine just suddenly shut off and is now not starting",
        "user": "itLGCnD7vf9P7eucZf3Kgo",
        "vehicle_type": "dgxThbdwDARVmQxDMzmuYt",
        "vehicle_part": "mNyhe7hNaDL3MpqtkofyS5",
        "assigned_mechanic": null,
        "advance_payment_status": "pending",
        "status": "complete",
        "created_at": "2023-10-05T17:19:44.893829Z"
      }),
    );
  }
}

final fakeRepairRequestRepositoryProvider =
    Provider((ref) => FakeRepairRequestRepository());

// final watchRepairRequestStateChangesProvider = StreamProvider((ref) {
//   final serviceProvider = ref.watch(fakeRepairRequestRepositoryProvider);
//   ref.onDispose(() => serviceProvider.dispose());
//   return serviceProvider._repairRequestStateChanges();
// });
