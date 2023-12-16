import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constants/managers/strings_manager.dart';
import '../constants/managers/values_manager.dart';
import '../model_utils.dart';

class HttpHelper {
  static Future<dynamic> guard(Future<Response> Function() request) async {
    try {
      var response = await request();
      if (response.statusCode == 200) {
        return Success(
          code: response.statusCode,
          response: response.body,
        );
      }
      return Failure(
        code: response.statusCode,
        stackTrace: StackTrace.current,
        errorResponse: jsonDecode(response.body)['detail'],
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
      return Failure(
        code: ApiStatusCode.unknownError,
        stackTrace: st,
        errorResponse: ApiStrings.unknownErrorString,
      );
    }
  }
}
