import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../common/core/repositories/user_settings_repository.dart';
import '../../../../utils/constants/managers/api_values_manager.dart';
import '../../../../utils/constants/managers/strings_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/model_utils.dart';
import 'repair_request_repository.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/status.dart' as status;

class APIRepairRequestRepository implements RepairRequestRepository {
  APIRepairRequestRepository({required this.ref});
  final Ref ref;

  @override
  Future<dynamic> fetchVechicleRepairRequest(String repairRequestId) async {
    try {
      var url = Uri.parse(
          '${RemoteManager.BASE_URI}repair_requests/$repairRequestId/');

      var response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        return Success(
          code: response.statusCode,
          response: response,
        );
      }
      return Failure(
        code: ApiStatusCode.invalidResponse,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.invalidResponseString,
      );
    } on HttpException {
      return Failure(
        code: ApiStatusCode.httpError,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.noInternetString,
      );
    } on FormatException {
      return Failure(
        code: ApiStatusCode.invalidResponse,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.invalidFormatString,
      );
    } catch (e, st) {
      // return Failure(code: 103, errorResponse: e.toString());
      return Failure(
        code: ApiStatusCode.unknownError,
        stackTrace: st,
        errorResponse: ApiStrings.unknownErrorString,
      );
    }
  }

  @override
  Future<dynamic> requestForVehicleRepair(
      Map<String, dynamic> requestInfo) async {
    try {
      var url = Uri.parse('${RemoteManager.BASE_URI}repair_requests/');

      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json; charset=utf-8",

          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: json.encode(requestInfo),
      );

      if (response.statusCode == ApiStatusCode.responseCreated) {
        return Success(
          code: response.statusCode,
          response: response,
        );
      }
      return Failure(
        code: ApiStatusCode.invalidResponse,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.invalidResponseString,
      );
    } on HttpException {
      return Failure(
        code: ApiStatusCode.httpError,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.noInternetString,
      );
    } on FormatException {
      return Failure(
        code: ApiStatusCode.invalidResponse,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.invalidFormatString,
      );
    } catch (e, st) {
      // return Failure(code: 103, errorResponse: e.toString());
      return Failure(
        code: ApiStatusCode.unknownError,
        stackTrace: st,
        errorResponse: ApiStrings.unknownErrorString,
      );
    }
  }

  @override
  Future<dynamic> addImagesToRepairRequest(
      String repairRequestId, List<File> images) async {
    try {
      var url = Uri.parse(
          '${RemoteManager.BASE_URI}/repair_requests/$repairRequestId/images/');

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
        "Accept": "application/json; charset=utf-8",
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
      });

      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();

      var responseBody = String.fromCharCodes(responseData);

      if (response.statusCode == ApiStatusCode.responseCreated) {
        return await fetchVechicleRepairRequest(repairRequestId);
      }
      return Failure(
          code: ApiStatusCode.invalidResponse,
          stackTrace: StackTrace.current,
          errorResponse: response.stream.toString());
    } on HttpException {
      return Failure(
          code: ApiStatusCode.httpError,
          stackTrace: StackTrace.current,
          errorResponse: ApiStrings.noInternetString);
    } on FormatException {
      return Failure(
          code: ApiStatusCode.invalidResponse,
          stackTrace: StackTrace.current,
          errorResponse: ApiStrings.invalidFormatString);
    } catch (e, st) {
      return Failure(
        code: 103,
        stackTrace: st,
        errorResponse: e.toString(),
      );
    }
  }

  @override
  Future fetchUserRepairRequest() async {
    try {
      var url =
          Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/repair_requests/');

      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            "BM ${ref.read(sharedPreferencesProvider).getString('access')!}",
      });

      if (response.statusCode == 200) {
        return Success(
          code: response.statusCode,
          response: response,
        );
      }
      return Failure(
        code: response.statusCode,
        stackTrace: StackTrace.current,
        errorResponse: response.body,
      );
    } on HttpException {
      return Failure(
        code: ApiStatusCode.httpError,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.noInternetString,
      );
    } on FormatException {
      return Failure(
        code: ApiStatusCode.invalidResponse,
        stackTrace: StackTrace.current,
        errorResponse: ApiStrings.invalidFormatString,
      );
    } catch (e, st) {
      // return Failure(code: 103, errorResponse: e.toString());
      return Failure(
        code: ApiStatusCode.unknownError,
        stackTrace: st,
        errorResponse: ApiStrings.unknownErrorString,
      );
    }
  }

  @override
  Future updateRepairRequest(
      String repairRequestId, Map<String, dynamic> requestInfo) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/repair_requests/$repairRequestId/');

    return await HttpHelper.guard(
        () => http.patch(url, body: jsonEncode(requestInfo), headers: {
              HttpHeaders.authorizationHeader:
                  "BM ${ref.read(sharedPreferencesProvider).getString('access')!}",
            }),
        ref);
  }

  @override
  Future<dynamic> watchUsersLocation(String repairRequestId) async {
    var url = Uri.parse(
        "${RemoteManager.WEB_SOCKET_BASE_URI}repair_userslocation/$repairRequestId");
    final channel = WebSocketChannel.connect(url);

    await channel.ready;

    channel.stream.listen((message) {
      print(message);
      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });
  }
}
