import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/auth/data/auth_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/managers/api_values_manager.dart';

import 'package:http/http.dart' as http;

import '../../../utils/constants/managers/strings_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';

class APIAuthRepository implements AuthRepository {
  @override
  Future createUserWithIdAndPassword(String uId, String password) {
    // TODO: implement createUserWithIdAndPassword
    throw UnimplementedError();
  }

  @override
  Future signInWithIdAndPassword(String uId, String password) async {
    try {
      var url = Uri.parse('${RemoteManager.BASE_URI}autho/create-token/');

      var response = await http
          .post(url, body: {"user_identifier": uId, "password": password});

      if (response.statusCode == 200) {
        return Success(
          code: response.statusCode,
          response: response,
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
      // return Failure(code: 103, errorResponse: e.toString());
      return Failure(
        code: ApiStatusCode.unknownError,
        stackTrace: st,
        errorResponse: ApiStrings.unknownErrorString,
      );
    }
  }

  @override
  Future getUserInfo(String token) async {
    try {
      var url = Uri.parse('${RemoteManager.BASE_URI}autho/users_info/me/');

      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: 'BM $token',
      });
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
      // return Failure(code: 103, errorResponse: e.toString());
      return Failure(
        code: ApiStatusCode.unknownError,
        stackTrace: st,
        errorResponse: ApiStrings.unknownErrorString,
      );
    }
  }

  @override
  void signOut(Ref ref) {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
  }
}
