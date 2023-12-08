import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/api_values_manager.dart';
import '../../../../utils/constants/managers/strings_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/model_utils.dart';
import '../user_settings_repository.dart';
import 'user_repository.dart';
import 'package:http/http.dart' as http;

class APIUserRepository extends UserRepository {
  APIUserRepository({required this.ref});

  final Ref ref;

  @override
  Future fetchUserInfo(String userIdx) async {
    try {
      var url = Uri.parse('${RemoteManager.BASE_URI}autho/user_info/$userIdx');

      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:
            'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
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
}
