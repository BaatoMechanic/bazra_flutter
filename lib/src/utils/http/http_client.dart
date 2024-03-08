import 'dart:convert';
import 'dart:io';
import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/logging/logger.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/exceptions/exceptions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class HttpHelper {
  static Future<dynamic> guard(
      Future<Response> Function() request, Ref ref) async {
    final logger = BMLogger().logger;
    try {
      var response = await request();
      logger.i(
          "${response.request?.method} ${response.request?.url.origin}${response.request?.url.path}");

      if (response.statusCode == 401) {
        logger.e("Unauthorized request");
        String? code = jsonDecode(response.body)['code'];
        if (code != null && code == 'token_not_valid'.hardcoded()) {
          String? refreshToken =
              ref.read(sharedPreferencesProvider).getString('refresh');
          if (refreshToken == null) {
            logger.e("Session expired");
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
      logger.e("Http error");
      throw HttpError(stackTrace: StackTrace.current);
      // return Failure(
      //   code: HttpStatus.httpVersionNotSupported,
      //   stackTrace: StackTrace.current,
      //   errorResponse: ApiStrings.httpErrorString,
      // );
    } on FormatException {
      logger.e("Format error");
      throw FormatError(stackTrace: StackTrace.current);
      // return Failure(
      //   code: HttpStatus.unprocessableEntity,
      //   stackTrace: StackTrace.current,
      //   errorResponse: ApiStrings.invalidFormatString,
      // );
    } catch (exp, st) {
      if (exp is BaseException) {
        logger.e(exp.message);
        rethrow;
      }

      logger.e(exp);
      throw BaseException(
        message: exp.toString(),
        stackTrace: st,
        errorCode: "unknown_error",
      );
    }
  }

  static dynamic _handleResponse(Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final logger = BMLogger().logger;
      logger.i(response.request);

      logger.i("Response Body: ${utf8.decode(response.bodyBytes)}");

      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    if (response.statusCode == 500) {
      throw BaseException(
          message: response.reasonPhrase ?? "Something went worng!",
          stackTrace: StackTrace.current);
    }

    final message = jsonDecode(response.body)['details'] ??
        jsonDecode(response.body)['detail'];

    if (message is List) {
      throw BaseException(
        message: message[0],
        statusCode: response.statusCode,
        stackTrace: StackTrace.current,
      );
    }

    throw BaseException(
      message: message ?? response.reasonPhrase,
      statusCode: response.statusCode,
      stackTrace: StackTrace.current,
    );
  }
}
