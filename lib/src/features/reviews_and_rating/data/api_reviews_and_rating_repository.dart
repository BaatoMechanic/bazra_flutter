import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/profile/data/reviews_and_rating_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../common/core/repositories/user_settings_repository.dart';
import '../../../utils/constants/managers/api_values_manager.dart';
import '../../../utils/constants/managers/strings_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';
import '../../../utils/model_utils.dart';

class ApiReviewsAndRatingRepository implements ReviewsAndRatingRepository {
  ApiReviewsAndRatingRepository(this.ref);
  final Ref ref;

  @override
  Future<dynamic> fetchMechanicReviews(String mechanicIdx) async {
    try {
      var url = Uri.parse(
          '${RemoteManager.BASE_URI}autho/reviews/mechanic_reviews/?idx=$mechanicIdx');

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
