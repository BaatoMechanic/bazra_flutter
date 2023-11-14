import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../../../utils/constants/managers/api_values_manager.dart';
import 'repair_request_repository.dart';

class FakeRepairRequestRepository implements RepairRequestRepository {
  @override
  Future<dynamic> requestForVehicleRepair(
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
    Response response = Response(jsonEncode(responseBody), HttpStatus.created);

    await Future.delayed(Duration(seconds: 2));
    return Success(code: HttpStatus.created, response: response);
  }

  @override
  Future addImagesToRepairRequest(
      String repairRequestId, List<File> images) async {
    Map<String, dynamic> responseBody = {
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
    };
    Response response = Response(jsonEncode(responseBody), HttpStatus.created);

    await Future.delayed(Duration(seconds: 2));
    return Success(code: HttpStatus.created, response: response);
    //   return Failure(
    //       code: HttpStatus.accepted,
    //       errorResponse: "Couldn't add images",
    //       stackTrace: StackTrace.current);
  }

  @override
  Future fetchVechicleRepairRequest(String repairRequestId) {
    // TODO: implement getVechicleRepairRequest
    throw UnimplementedError();
  }

  @override
  Future fetchUserRepairRequest(String userId) async {
    Map<String, dynamic> responseBody = {
      "id": 2,
      "customer": 1,
      "preferred_mechanic": 1,
      "assigned_mechanic": 1,
      "location_name":
          "Paneku Marg, Paneku Tol, Chabahil, Kathmandu-07, Kathmandu, Kathmandu Metropolitan City, Kathmandu, Bagmati Province, 44660, Nepal",
      "location_coordinates": "27.70862555398949,85.33758702603099",
      "vehicle": 1,
      "vehicle_part": 1,
      "title": "Tire Repair",
      "description": "Tire repair and replacement.",
      "images": [],
      "videos": [],
      // "status": "IN_PROGRESS",
      "status": "WAITING_COMPLETION_ACCEPTANCE",
      // "status": "WAITING_FOR_MECHANIC",
      // "status": "WAITING_FOR_ADVANCE_PAYMENT",
      "created_at": "2023-10-05T17:19:44.893829Z"
    };
    // Response response = Response(jsonEncode([]), HttpStatus.created);
    Response response =
        Response(jsonEncode([responseBody]), HttpStatus.created);

    await Future.delayed(const Duration(seconds: 1));
    return Success(code: HttpStatus.ok, response: response);
  }
}
