import 'dart:convert';
import 'dart:io';
import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/exceptions/exceptions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../constants/managers/strings_manager.dart';
import '../constants/managers/values_manager.dart';
import '../model_utils.dart';

class HttpHelper {
  static Future<dynamic> guard(
      Future<Response> Function() request, Ref ref) async {
    try {
      var response = await request();

      if (response.statusCode == 401) {
        String code = jsonDecode(response.body)['code'];
        if (code == 'token_not_valid'.hardcoded()) {
          String? refreshToken =
              ref.read(sharedPreferencesProvider).getString('refresh');
          if (refreshToken == null) {
            throw BaseException(
              statusCode: response.statusCode,
              errorCode: code,
              message: "Session expired, please log in again",
              redirectLink: APP_ROUTE.login.name,
              stackTrace: StackTrace.current,
            );
          }
          // Removing refresh token from shared preferences to prevent using it again and encountering infinite loop
          // because when the status code is 401 during refreshing token, it will try to use old refresh token again
          // to refresh the token causing the infinite loop
          await ref.read(sharedPreferencesProvider).remove('refresh');

          await ref.read(authServiceProvider).refreshToken(refreshToken);

          // If refresh is successful then append the same refresh token as refreshing will only give access token
          ref
              .read(sharedPreferencesProvider)
              .setString('refresh', refreshToken);

          await request();
        }
      }
      return _handleResponse(response);
    } on HttpException {
      throw HttpError(stackTrace: StackTrace.current);
      // return Failure(
      //   code: HttpStatus.httpVersionNotSupported,
      //   stackTrace: StackTrace.current,
      //   errorResponse: ApiStrings.httpErrorString,
      // );
    } on FormatException {
      throw FormatError(stackTrace: StackTrace.current);
      // return Failure(
      //   code: HttpStatus.unprocessableEntity,
      //   stackTrace: StackTrace.current,
      //   errorResponse: ApiStrings.invalidFormatString,
      // );
    } catch (exp, st) {
      if (exp is BaseException) {
        rethrow;
      }

      throw BaseException(
        message: exp.toString(),
        stackTrace: st,
        errorCode: "unknown_error",
      );
    }
  }

  static dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body;
    }
    throw BaseException(
      message: jsonDecode(response.body)['detail'],
      statusCode: response.statusCode,
      stackTrace: StackTrace.current,
    );
  }
}
// class HttpHelper {
//   static Future<dynamic> guard(
//       Future<Response> Function() request, Ref ref) async {
//     try {
//       var response = await request();

//       if (response.statusCode == 401) {
//         String code = jsonDecode(response.body)['code'];
//         if (code == 'token_not_valid'.hardcoded()) {
//           String? refreshToken =
//               ref.read(sharedPreferencesProvider).getString('refresh');
//           if (refreshToken == null) {
//             throw BaseException(
//               statusCode: response.statusCode,
//               errorCode: code,
//               message: "Session expired, please log in again",
//               redirectLink: APP_ROUTE.login.name,
//             );
//           }
//           // Removing refresh token from shared preferences to prevent using it again and encountering infinite loop
//           // because when the status code is 401 during refreshing token, it will try to use old refresh token again
//           // to refresh the token causing the infinite loop
//           await ref.read(sharedPreferencesProvider).remove('refresh');

//           await ref.read(authServiceProvider).refreshToken(refreshToken);

//           // If refresh is successful then append the same refresh token as refreshing will only give access token
//           ref
//               .read(sharedPreferencesProvider)
//               .setString('refresh', refreshToken);

//           await request();
//         }
//       }
//       return _handleResponse(response);
//     } on HttpException {
//       return Failure(
//         code: HttpStatus.httpVersionNotSupported,
//         stackTrace: StackTrace.current,
//         errorResponse: ApiStrings.httpErrorString,
//       );
//     } on FormatException {
//       return Failure(
//         code: HttpStatus.unprocessableEntity,
//         stackTrace: StackTrace.current,
//         errorResponse: ApiStrings.invalidFormatString,
//       );
//     } catch (exp, st) {
//       if (exp is BaseException) {
//         return Failure(
//             code: exp.statusCode,
//             errorCode: exp.errorCode,
//             stackTrace: st,
//             errorResponse: exp.message,
//             redirectLink: exp.redirectLink);
//       }

//       return Failure(
//           errorResponse: exp.toString(),
//           stackTrace: st,
//           code: ApiStatusCode.unknownError,
//           errorCode: 'unknown_error');
//     }
//   }

//   static dynamic _handleResponse(Response response) {
//     if (response.statusCode == 200) {
//       return Success(
//         code: response.statusCode,
//         response: response.body,
//       );
//     }
//     return Failure(
//       code: response.statusCode,
//       stackTrace: StackTrace.current,
//       errorResponse: jsonDecode(response.body)['detail'],
//     );
//   }
// }
