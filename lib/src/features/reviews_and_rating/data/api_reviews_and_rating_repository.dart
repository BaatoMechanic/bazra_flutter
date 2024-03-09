import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/reviews_and_rating/data/reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../common/repositories/user_settings_repository.dart';
import '../../../utils/constants/managers/api_values_manager.dart';

class ApiReviewsAndRatingRepository implements ReviewsAndRatingRepository {
  ApiReviewsAndRatingRepository(this.ref);
  final Ref ref;

  @override
  Future<List<ReviewAndRating>> fetchMechanicReviews(String mechanicIdx) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}autho/reviews/mechanic_reviews/?idx=$mechanicIdx');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
    return reviewsAndRatingsFromJson(jsonDecode(response));
  }
}
