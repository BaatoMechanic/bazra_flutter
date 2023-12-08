import 'dart:convert';

import 'package:bato_mechanic/src/features/profile/data/reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/reviews_and_rating.dart';

class ReviewsAndRatingService {
  ReviewsAndRatingService({
    required this.ref,
  });
  final Ref ref;

  Future<dynamic> fetchMechanicReviews(String mechanicIdx) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await ref
        .read(reviewsAndRatingRepositoryProvider)
        .fetchMechanicReviews(mechanicIdx);

    if (response is Success) {
      List<ReviewAndRating> reviews =
          reviewsAndRatingsFromJson(jsonDecode(response.response as String));
      return reviews;
    }
    if (response is Failure) {
      throw BaseException(message: response.errorResponse.toString());
    }
  }
}

final reviewsAndRatingServiceProvider = Provider((ref) {
  return ReviewsAndRatingService(ref: ref);
});
