import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../managers/api_values_manager.dart';
import '../../../../managers/strings_manager.dart';
import '../../../../managers/values_manager.dart';
import '../../../../utils/model_utils.dart';
import 'repair_request_repository.dart';
import 'package:http/http.dart' as http;

class APIRepairRequestRepository implements RepairRequestRepository {
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
  Future fetchUserRepairRequest(String userId) {
    // TODO: implement fetchUserRepairRequest
    throw UnimplementedError();
  }
}
