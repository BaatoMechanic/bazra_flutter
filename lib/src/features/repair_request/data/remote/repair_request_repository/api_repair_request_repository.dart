import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/repair_progress/domain/repair_step.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../common/core/repositories/user_settings_repository.dart';
import '../../../../../utils/constants/managers/api_values_manager.dart';
import '../../../../../utils/constants/managers/values_manager.dart';
import 'repair_request_repository.dart';
import 'package:http/http.dart' as http;

class APIRepairRequestRepository implements RepairRequestRepository {
  APIRepairRequestRepository({required this.ref});
  final Ref ref;

  @override
  Future<VehicleRepairRequest> fetchVechicleRepairRequest(
      String repairRequestId) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/repair_requests/$repairRequestId/');

    var response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
    return VehicleRepairRequest.fromJson(jsonDecode(response));
  }

  @override
  Future<VehicleRepairRequest> requestForVehicleRepair(
      Map<String, dynamic> requestInfo) async {
    var url =
        Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/repair_requests/');

    final response = await HttpHelper.guard(
        () => http.post(
              url,
              headers: {
                HttpHeaders.acceptHeader: "application/json",
                HttpHeaders.authorizationHeader:
                    'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
                HttpHeaders.contentTypeHeader: "application/json",
              },
              body: jsonEncode(requestInfo),
            ),
        ref);

    return VehicleRepairRequest.fromJson(jsonDecode(response));
  }

  @override
  Future<VehicleRepairRequest> addImagesToRepairRequest(
      String repairRequestId, List<File> images) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/repair_requests/$repairRequestId/images/');

    var request = http.MultipartRequest("POST", url);

    for (var i = 0; i < images.length; i++) {
      var pic = await http.MultipartFile.fromPath(
        'images',
        // 'image ${i + 1}',
        images[i].path,
      );
      request.files.add(pic);
    }

    request.headers.addAll({
      // HttpHeaders.authorizationHeader: "SL " + loggedinSession.accessToken,
      HttpHeaders.authorizationHeader:
          'BM ${ref.read(sharedPreferencesProvider).getString('access')!}',
      "Accept": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
    });

    var response = await request.send();

    //Get the response from the server
    // var responseData = await response.stream.toBytes();

    // var responseBody = String.fromCharCodes(responseData);

    if (response.statusCode == ApiStatusCode.responseCreated) {
      return await fetchVechicleRepairRequest(repairRequestId);
    } else {
      throw BaseException(
        message: response.toString(),
        stackTrace: StackTrace.current,
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<List<VehicleRepairRequest>> fetchUserRepairRequest() async {
    var url =
        Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/repair_requests/');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  "BM ${ref.read(sharedPreferencesProvider).getString('access')!}",
            }),
        ref);
    return vehicleRepairRequestsFromJson(response);
  }

  @override
  Future<List<VehicleRepairRequest>> fetchUserActiveRepairRequest() async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/repair_requests/user_active_repair_requests/');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  "BM ${ref.read(sharedPreferencesProvider).getString('access')!}",
            }),
        ref);
    return vehicleRepairRequestsFromJson(response);
  }

  @override
  Future<List<VehicleRepairRequest>> fetchUserRecentRepairRequest() async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/repair_requests/user_recent_repair_requests/');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  "BM ${ref.read(sharedPreferencesProvider).getString('access')!}",
            }),
        ref);
    return vehicleRepairRequestsFromJson(response);
  }

  @override
  Future<VehicleRepairRequest> updateRepairRequest(
      String repairRequestId, Map<String, dynamic> requestInfo) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/repair_requests/$repairRequestId/');

    final response = await HttpHelper.guard(
        () => http.patch(url, body: requestInfo, headers: {
              HttpHeaders.acceptHeader: "application/json; charset=utf-8",
              HttpHeaders.authorizationHeader:
                  "BM ${ref.read(sharedPreferencesProvider).getString('access')!}",
            }),
        ref);

    return VehicleRepairRequest.fromJson(jsonDecode(response));
  }
}

final watchRepairStepsProvider = StreamProvider.autoDispose
    .family<List<RepairStep>, String>((ref, repairRequestIdx) async* {
  var url = Uri.parse(
      "${RemoteManager.WEB_SOCKET_BASE_URI}repair-steps/$repairRequestIdx");
  final channel = WebSocketChannel.connect(url);

  ref.onDispose(() => channel.sink.close());

  await for (final value in channel.stream) {
    try {
      yield repairStepsFromJson(value);
    } catch (e) {
      yield repairStepsFromJson(value);
    }
  }
});
